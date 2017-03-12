//
//  Produce.swift
//  Ripe
//
//  Created by Matthew Paletta on 2017-03-11.
//  Copyright © 2017 Matthew Paletta. All rights reserved.
//

import UIKit

class Produce: NSObject {
    var name: String!
    var price: Double!
    
    var image: String!
    var cover: String?
    
    var isWeighted: Bool!
    var children: [Produce]?
}
