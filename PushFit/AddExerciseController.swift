//
//  AddExerciseController.swift
//  PushFit
//
//  Created by Hevert Peralta on 11/22/21.
//

import UIKit

class AddExerciseController: UIViewController {
    
    @IBOutlet weak var setsTextField: UITextField!
    @IBOutlet weak var repsTextField: UITextField!
    
    var index : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addExercise(_ sender: Any) {
        if let tbc = self.tabBarController as? MainTabController {
             // do something with tbc.myInformation
            index = tbc.pubExercises.count-1
            tbc.check = 1
            
            //tbc.pubExercises[0]["Sets": setsTextField.text!]
            tbc.pubExercises.append(["Reps": repsTextField.text!])
            
            
         }
        performSegue(withIdentifier: "unwind", sender: self)
    }
    
    
    @IBAction func cancelAdd(_ sender: Any) {
        if let tbc = self.tabBarController as? MainTabController {
             // do something with tbc.myInformation
            index = tbc.pubExercises.count-1
            tbc.pubExercises.remove(at: index)
            
         }
        self.dismiss(animated: true, completion: nil)
        
    }
    
    /*// MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let tbc = self.tabBarController as? MainTabController {
             // do something with tbc.myInformation
            index = tbc.pubExercises.count-1
            tbc.check = 1
            tbc.pubExercises.append(["Sets": setsTextField.text!])
            tbc.pubExercises.append(["Reps": repsTextField.text!])
            
            
         }
        let HomeController = segue.destination as! HomeController
    }*/
    

}
