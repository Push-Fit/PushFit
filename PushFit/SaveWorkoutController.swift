//
//  SaveWorkoutController.swift
//  PushFit
//
//  Created by Hevert Peralta on 11/22/21.
//

import UIKit

class SaveWorkoutController: UIViewController {

    @IBOutlet weak var popUp: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        popUp.layer.cornerRadius = 5;
        popUp.layer.masksToBounds = true;

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
