//
//  HomeCell.swift
//  PushFit
//
//  Created by Hevert Peralta on 12/5/21.
//

import UIKit

class HomeCell: UITableViewCell {

    
    @IBOutlet weak var exerciseView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var setsLabel: UILabel!
    
    @IBOutlet weak var repsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        exerciseView.layer.borderWidth = 1
        exerciseView.layer.masksToBounds = false
        exerciseView.layer.borderColor = UIColor.black.cgColor
        exerciseView.layer.cornerRadius = exerciseView.frame.height/2
        exerciseView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
