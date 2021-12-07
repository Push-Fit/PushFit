//
//  ExerciseCell.swift
//  PushFit
//
//  Created by Hevert Peralta on 11/29/21.
//

import UIKit

class ExerciseCell: UITableViewCell {

    @IBOutlet weak var targetView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var partLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        targetView.layer.borderWidth = 1
        targetView.layer.masksToBounds = false
        targetView.layer.borderColor = UIColor.black.cgColor
        targetView.layer.cornerRadius = targetView.frame.height/2
        targetView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
