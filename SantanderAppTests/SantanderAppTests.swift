//
//  SantanderAppTests.swift
//  SantanderAppTests
//
//  Created by Andre Nogueira on 24/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import XCTest
@testable import SantanderApp

class SantanderAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
      
    }
    
    override func tearDown() {
       
        super.tearDown()
    }
    
    func testSantanderRouter() {
        let finishedScreen = SantanderRouter.instanceFinishedViewController()
        XCTAssertNotNil(finishedScreen)
        
        let emailTypeField = SantanderRouter.instanceSantanderEmailTypeFieldFromNib()
        XCTAssertNotNil(emailTypeField)
        
        let textField = SantanderRouter.instanceSantanderTextTypeFieldFromNib()
        XCTAssertNotNil(textField)

        let phoneField = SantanderRouter.instanceSantanderPhoneTypeFieldFromNib()
        XCTAssertNotNil(phoneField)
        
        let fundVC = SantanderRouter.instanceSantanderFundViewController()
        XCTAssertNotNil(fundVC)

    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }
    
}
