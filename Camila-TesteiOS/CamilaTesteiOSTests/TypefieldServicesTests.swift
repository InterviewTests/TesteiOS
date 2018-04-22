//
//  TypefieldServicesTests.swift
//  CamilaTesteiOSTests
//
//  Created by camila oliveira on 22/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import XCTest
@testable import CamilaTesteiOS

class TypefieldServicesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEmailValidation() {
        let validator = TypefieldValidator(TypeField.email)
        XCTAssertEqual(validator.validate("teste@gmail.com"), true)
        XCTAssertEqual(validator.validate("teste@gmail"), false)
        XCTAssertEqual(validator.validate("teste-gmail.com"), false)
    }
    
    func testPhoneValidation() {
        let validator = TypefieldValidator(TypeField.telNumber)
        XCTAssertEqual(validator.validate("9999999999"), true)
        XCTAssertEqual(validator.validate("99999999999"), true)
        XCTAssertEqual(validator.validate("tt99999999999"), true)
        XCTAssertEqual(validator.validate("888"), false)
    }
    func testTextValidation(){
        let validator = TypefieldValidator(TypeField.text)
        XCTAssertEqual(validator.validate("9999999999"), true)
        XCTAssertEqual(validator.validate("aaaaa"), true)
        XCTAssertEqual(validator.validate(""), false)
    }
    
    
}
