//
//  MemeTableViewCell.swift
//  MemeMe
//
//  Created by Patrick Bellot on 10/7/15.
//  Copyright © 2015 Irish Poet. All rights reserved.
//

import UIKit

class MemeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var memeImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
