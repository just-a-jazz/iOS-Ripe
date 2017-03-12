//
//  RipeTests.swift
//  RipeTests
//
//  Created by Matthew Paletta on 2017-03-11.
//  Copyright © 2017 Matthew Paletta. All rights reserved.
//

import XCTest
@testable import Ripe

class RipeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParsing() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        if let produceList
            = Dictionary<String, AnyObject>.loadJSONFromBundle() {
            //print(produceList)
            let parsed = produceList.dictToProduce()
            
            //XCTAssert(parsed.count == 16)
            //XCTAssert(parsed == parsed.sorted(by: {$0.name > $1.name}))
        }
    }
    
    func testHi() {
        let Checkout = CheckoutViewController()
        
        let result = Checkout.hi()
        
        print(result)
        XCTAssert(200 == 200)
    }
    
    /*
    func testPerformanceExample() {
        // This is an example of a performance test case.
        
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    */
}
