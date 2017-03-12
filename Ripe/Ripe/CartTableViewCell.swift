//
//  CartTableViewCell.swift
//  Ripe
//
//  Created by Matthew Paletta on 2017-03-11.
//  Copyright © 2017 Matthew Paletta. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var produceImageView: UIImageView!
    @IBOutlet weak var produceNameLabel: UILabel!
    @IBOutlet weak var produceAmountLabel: UILabel!
    @IBOutlet weak var produceDollarLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
