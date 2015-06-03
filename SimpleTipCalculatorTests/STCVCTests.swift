//
//  STCVCTests.swift
//  SimpleTipCalculator
//
//  Created by Derek Jensen on 5/28/15.
//  Copyright (c) 2015 Derek Jensen. All rights reserved.
//

import UIKit
import XCTest

class STCVCTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testImportantFuncIsTrue() {
        var storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        var vc = storyboard.instantiateViewControllerWithIdentifier("STCVC") as! SimpleTipCalculatorViewController
        
        vc.loadView()
        
        XCTAssertTrue(vc.veryImportantFunc(), "This should be true")
    }
}
