//
//  SingleLabelWithImageTableViewCell.swift
//  Sunset
//
//  Created by Brian Veitch on 11/23/22.
//

import UIKit

class SingleLabelWithImageTableViewCell: UITableViewCell {
    
    let identifier = "SingleLabelWithImageTableViewCell"
    
    @IBOutlet var title: UILabel!
    @IBOutlet var actionButton: UIButton!
    @IBOutlet var cellView: UIView!
    @IBOutlet var singleImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
