//
//  SingleLabelTableViewCell.swift
//  Games
//
//  Created by Brian Veitch on 11/22/22.
//

import UIKit

class SingleLabelTableViewCell: UITableViewCell {
    
    @IBOutlet var name: UILabel!
    @IBOutlet var cellView: UIView!
    @IBOutlet var actionButton: UIButton!
    
    let identifier = "SingleLabelTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius = 10
        cellView.backgroundColor = Color.backgroundColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
