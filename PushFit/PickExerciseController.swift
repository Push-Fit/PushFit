//
//  PickExerciseController.swift
//  PushFit
//
//  Created by Hevert Peralta on 11/22/21.
//

import UIKit

class PickExerciseController: UITableViewController {
    
    var exercises = [[String:String]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //URL
        let url = URL(string: "https://exercisedb.p.rapidapi.com/exercises")!
        
        //Request & Headers
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        let header = ["x-rapidapi-host": "exercisedb.p.rapidapi.com",
                       "x-rapidapi-key": "b7818d6a0fmsh33b0ed1193cbac7p15ae67jsne5b4c40aac6a"]
        request.allHTTPHeaderFields = header
        
        //Request Type
        request.httpMethod = "GET"
        
        //URLSession
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        //Data Task
        let task = session.dataTask(with: request) { data, response, error in
            
            // This will run when the network request returns
            if let error = error {
                   print(error.localizedDescription)
            } else if let data = data {
                   let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String:String]]
                print("\n Inside of get. \n ")
                //print(dataDictionary)
                self.exercises = dataDictionary
                print(self.exercises[0]["name"]!)
                print(self.exercises[0])
                self.tableView.reloadData()
        }
            
        }
        task.resume()
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return exercises.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell") as! ExerciseCell

        // Configure the cell...
        
        let exercise = exercises[indexPath.row]
       
        let exerciseName = exercise["name"]!
        //print(exerciseName)
        let exerciseBodyPart = exercise["target"]!
        //print(exerciseBodyPart)
        
        cell.nameLabel.text = exerciseName
        cell.partLabel.text = exerciseBodyPart
        cell.targetView.image = UIImage(named: "bicep")
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let exercise = exercises[indexPath.row]
        let sets = ["Sets":"2"]
        if let tbc = self.tabBarController as? MainTabController {
             // do something with tbc.myInformation
            tbc.pubExercises.append(exercise)
            tbc.pubExercises[0]["Sets"] = "2"
         }
        let addController = segue.destination as! AddExerciseController
        
        
        
        
        
        
        
    }
    

}
