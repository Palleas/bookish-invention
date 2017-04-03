//
//  ClientTests.swift
//  RomeReactiveCocoaTest
//
//  Created by Romain Pouclet on 2017-04-03.
//  Copyright © 2017 Perfectly-Cooked. All rights reserved.
//

import XCTest
@testable import RomeReactiveCocoaTest

class ClientTests: XCTestCase {
    
    func testFetchingAUser() {
        let c = Client()
        let name = c.user().first()!.value!.name
        
        XCTAssertEqual("BlueWhale 2194", name)
    }
    
}
