//
//  HomeController.swift
//  PushFit
//
//  Group Members: Hevert Peralta, Alejandro Mirando, Felipe Durango
//  Group 9: Push Fit
//

import UIKit

class HomeController: UITableViewController {

    var index = 0
    
    var sr = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //get items from CoreData
        //fetchPeople()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let tbc = self.tabBarController as? MainTabController {
            if(tbc.pubExercises.isEmpty == false){
                print("\n Back from pick. \n")
                print(tbc.pubExercises.count)
                let count = tbc.pubExercises.count-1
                for i in 0...count{
                    print("Loop Index \(i)\n")
                    print(tbc.pubExercises[i])
                    print("\n")
            
                }
                print("Whole Array: \(tbc.pubExercises)\n")
                print("Sets: \(tbc.setNum) Reps: \(tbc.repNum)\n");
                
            }
        }
        self.tableView.reloadData()
    }
    

    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as? AddExerciseController
        // Use data from the view controller which initiated the unwind segue
        let i = sourceViewController!.setsAndReps.count-1
        let src = sourceViewController?.setsAndReps
        sr.append(src![i])
        
    }
    /*func fetchPeople(){
        
        //fetch data from CoreData
        do{
            self.workouts = try context.fetch(Workouts.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            
        } catch{}
        
    }*/

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if let tbc = self.tabBarController as? MainTabController {
            
            index = tbc.pubExercises.count
            
        }
        
        return index
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeCell

        // Configure the cell...
        if let tbc = self.tabBarController as? MainTabController {
             // do something with tbc.myInformation
            let exercise = tbc.pubExercises[indexPath.row]
           
            let exerciseName = exercise["name"]!
            
            
            cell.nameLabel.text = exerciseName
            cell.exerciseView.image = UIImage(named: "ls")
            cell.setsLabel.text = sr[indexPath.row]["Sets"]
            cell.repsLabel.text = sr[indexPath.row]["Reps"]
            
         }
        
        
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
