//
//  TesteiOSUnitTests.swift
//  TesteiOSUnitTests
//
//  Created by Carolina Bonturi on 7/3/18.
//  Copyright © 2018 Carolina Bonturi. All rights reserved.
//

import XCTest
@testable import TesteiOS

class TesteiOSUnitTests: XCTestCase {
    
    let SUCCESS = 1
    let FAIL = 0
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testNameInput() {
        let result = Validation.shared.validate(type: ValidationType.name, inputValue: "Carolina")
        XCTAssert(result.rawValue == SUCCESS, "Name validation failed")
    }
    
    func testNameInputEmpty() {
        let result = Validation.shared.validate(type: ValidationType.name, inputValue: "")
        XCTAssert(result.rawValue == FAIL, "Name emptiness validation failed")
    }
    
    func testEmailInput() {
        let result1 = Validation.shared.validate(type: ValidationType.email, inputValue: "carolina@gmail.com")
        let result2 = Validation.shared.validate(type: ValidationType.email, inputValue: "carolina@gmail")
        
        XCTAssert(result1.rawValue == SUCCESS && result2.rawValue == FAIL, "Email validation failed")
    }
    
    func testEmailInputEmpty() {
        let result = Validation.shared.validate(type: ValidationType.email, inputValue: "")
        XCTAssert(result.rawValue == FAIL, "Email emptiness validation failed")
    }
    
    func testPhoneInput() {
        let result1 = Validation.shared.validate(type: ValidationType.phoneNumber, inputValue: "(13) 5")
        let result2 = Validation.shared.validate(type: ValidationType.phoneNumber, inputValue: "(98) 7765-6784")
        let result3 = Validation.shared.validate(type: ValidationType.phoneNumber, inputValue: "(98) 77656-7840")
        
        XCTAssert(result1.rawValue == FAIL && result2.rawValue == SUCCESS && result3.rawValue == SUCCESS, "Phone validation failed")
    }
    
    func testPhoneInputEmpty() {
        let result = Validation.shared.validate(type: ValidationType.phoneNumber, inputValue: "")
        XCTAssert(result.rawValue == FAIL, "Phone emptiness validation failed")
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
