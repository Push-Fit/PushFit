//
//  AddExerciseController.swift
//  PushFit
//
//  Group Members: Hevert Peralta, Alejandro Mirando, Felipe Durango
//  Group 9: Push Fit
//

import UIKit

class AddExerciseController: UIViewController {
    
    @IBOutlet weak var setsTextField: UITextField!
    @IBOutlet weak var repsTextField: UITextField!
    
    var index : Int = 0
    var setsAndReps = [[String:String]]()
    var set: String = ""
    var rep: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addExercise(_ sender: Any) {
        set = setsTextField.text ?? "xx"
        rep = repsTextField.text ?? "xx"
        let sr = ["Sets":"\(set) Sets", "Reps":"\(rep) Reps"]
        setsAndReps.append(sr)
        
        
        
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
        
        
        let HomeController = segue.destination as! HomeController
     if let tbc = self.tabBarController as? MainTabController {
          // do something with tbc.myInformation
         tbc.setNum = setsTextField.text!
         tbc.repNum = repsTextField.text!
         index = tbc.pubExercises.count-1
         tbc.pubExercises[index]["Sets"] = "\(tbc.setNum)"
         tbc.pubExercises[index]["Reps"] = "\(tbc.repNum)"
         print("\naddExercise\nSets: \(tbc.setNum) Reps: \(tbc.repNum)")
         tbc.check = 1
         
         //tbc.pubExercises[0]["Sets": setsTextField.text!]
         //tbc.pubExercises.append(["Reps": repsTextField.text!])
         
         
      }
    }*/
    

}
