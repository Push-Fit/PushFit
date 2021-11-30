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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
