//
//  CustomTableViewCell.swift
//  test
//
//  Created by Vladislav Shapran on 30.11.2020.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var nameMovie: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
