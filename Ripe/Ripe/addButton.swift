//
//  addButton.swift
//  Party
//
//  Created by Ali Siddiqui on 1/19/17.
//  Copyright © 2017 Ali Siddiqui and Matthew Paletta. All rights reserved.
//

import UIKit

class addButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.width / 2
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 5, 0)
    }
}
