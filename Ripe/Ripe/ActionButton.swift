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
        let primaryColor = UIColor(red: 245/255, green: 165/255, blue: 35/255, alpha: 1)
        
        backgroundColor = primaryColor
        titleLabel?.textColor = .white
        tintColor = UIColor.white
        
        layer.masksToBounds = true
        layer.cornerRadius = frame.height / 2
        // Shadow and Radius
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.5)
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 0.0
        layer.masksToBounds = false
        //globeButton.layer.cornerRadius = 4.0
    }
}
