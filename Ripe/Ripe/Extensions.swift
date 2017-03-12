//
//  Extensions.swift
//  Ripe
//
//  Created by Matthew Paletta on 2017-03-11.
//  Copyright © 2017 Matthew Paletta. All rights reserved.
//

import Foundation
import UIKit


extension UIImageView {
    func addBlackGradientLayer(frame: CGRect){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
        gradient.locations = [0.0, 0.5]
        self.layer.addSublayer(gradient)
    }
}

extension UITextField {
    func addBottomBorder() {
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x:0.0, y:self.frame.height - 1, width:self.frame.width, height:2.0)
        bottomLine.backgroundColor = UIColor.orange.cgColor
        self.borderStyle = UITextBorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
}
