//
//  ActionButton.swift
//  Ripe
//
//  Created by Ali Siddiqui on 3/12/17.
//  Copyright © 2017 Matthew Paletta. All rights reserved.
//

import Foundation
import UIKit

class ActionButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        backgroundColor = .orange
        titleLabel?.textColor = .white
        
        layer.masksToBounds = true
        layer.cornerRadius = frame.height / 2
        contentEdgeInsets = UIEdgeInsetsMake(0, 0, 5, 0)
    }
}
