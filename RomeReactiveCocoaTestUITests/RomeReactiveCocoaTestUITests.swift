//
//  RomeReactiveCocoaTestUITests.swift
//  RomeReactiveCocoaTestUITests
//
//  Created by Romain Pouclet on 2017-04-03.
//  Copyright © 2017 Perfectly-Cooked. All rights reserved.
//

import XCTest

class RomeReactiveCocoaTestUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
       
        XCUIApplication().launch()
    }
    
    func testDoingStuff() {
        let app = XCUIApplication()
        app.switches["First pink switch"].tap()
        app.switches["Second green switch"].tap()
        app.switches["Third red switch"].tap()
        app.switches["Second green switch"].tap()
    }
}
