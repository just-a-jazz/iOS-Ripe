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

extension Dictionary {
    
    // Loads a JSON file from the app bundle into a new dictionary
    static func loadJSONFromBundle() -> Dictionary <String, AnyObject>? {
        var dataOK: Data
        var dictionaryOK: NSDictionary = NSDictionary()
        if let path = Bundle.main.path(forResource: "ProduceList", ofType: "json") {
            let _: NSError?
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: NSData.ReadingOptions()) as Data!
                dataOK = data!
            }
            catch {
                print("Could not load level file: ProduceList, error: \(error)")
                return nil
            }
            
            do {
                let dictionary = try JSONSerialization.jsonObject(with: dataOK, options: JSONSerialization.ReadingOptions()) as AnyObject!
                dictionaryOK = (dictionary as! NSDictionary as? Dictionary <String, AnyObject>)! as NSDictionary
            }
            catch {
                print("Level file ProduceList is not valid JSON: \(error)")
                return nil
            }
        }
        
        //return dictionaryOK as? Dictionary <String, AnyObject>
        /*if let dict = dictionaryOK {
            return dictToProduce(dict)
        }*/
        
        return dictionaryOK as? Dictionary <String, AnyObject>

    }
}

extension Dictionary where Key: StringLiteralConvertible {
    func dictToProduce()->[Produce] {
        //print(self["produce"])
        if let produce = self["produce"] as? NSArray {
            for dict in produce {
                if let d = dict as? [String: Dictionary] {
                    if let name = d["name"] as? String {
                        print("Hello", name)
                    }
                }
                print(dict)
            }
        }
        
        
        return [Produce]()
    }
    
    private func findProduceCategory(search: String, products: [Produce])->Int {
        for i in 0..<products.count {
            if search == products[i].name {
                return i
            }
        }
        return -1
    }

}
