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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
