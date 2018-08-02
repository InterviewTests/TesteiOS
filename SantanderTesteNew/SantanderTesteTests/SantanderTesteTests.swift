//
//  SantanderTesteTests.swift
//  SantanderTesteTests
//
//  Created by Nayara on 05/07/2018.
//  Copyright © 2018 Nayara. All rights reserved.
//

import XCTest
@testable import SantanderTeste

class SantanderTesteTests: XCTestCase {
    
    func testEmailValidation() {
        let email = "user@mail.com"
        let result = Util.shared.isValidEmail(email: email)
        XCTAssertTrue(result)
    }
    
    func testIncorrectEmailValidation() {
        let email = "user@com"
        let result = Util.shared.isValidEmail(email: email)
        XCTAssertFalse(result)
    }
    
    func testPhoneValidationOnze(){
        let phone = "92981601411"
        let result = phone.isPhoneNumber
        XCTAssertTrue(result)
    }
    
    func testPhoneValidationDez(){
        let phone = "9281601411"
        let result = phone.isPhoneNumber
        XCTAssertTrue(result)
    }
    
    func testIncorrectPhoneValidation(){
        let phone = "81601411"
        let result = phone.isPhoneNumber
        XCTAssertFalse(result)
    }
    
    
    
}
