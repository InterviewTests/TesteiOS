//
//  ValidateTests.swift
//  TesteIOSTests
//
//  Created by Sidney Silva on 18/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import XCTest
@testable import TesteIOS

class ValidateTests: XCTestCase {
    
    var mockValidEmail: String!
    var mockValidPhone: String!
    var mockValidName: String!
    var mockInvalidEmail: String!
    var mockInvalidPhone: String!
    var mockEmptyName: String!
    var mockOnlyNumberPhone: String!
    var mockNotOnlyNumberPhone: String!
    var textField: UITextField!
    
    override func setUp() {
        super.setUp()
        textField = UITextField()
        mockValidName = "Sidney Silva"
        mockEmptyName = ""
        mockValidEmail = "sidney_silva13@outlook.com"
        mockInvalidEmail = "sidney_silva.outlook.com"
        mockValidPhone = "(11) 98825-5967"
        mockInvalidPhone = "98825-598"
        mockOnlyNumberPhone = "11988255967"
        mockNotOnlyNumberPhone = "abd11988aa255967"
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_name_when_valid() {
        textField.text = mockValidName
        let isValid = textField.fieldValidate(typeField: .text)
        XCTAssertEqual(isValid, true)
    }
    
    func test_name_when_invalid() {
        textField.text = mockEmptyName
        let isValid = textField.fieldValidate(typeField: .text)
        XCTAssertEqual(isValid, false)
    }
    
    func test_email_when_valid() {
        textField.text = mockValidEmail
        let isValid = textField.fieldValidate(typeField: .email)
        XCTAssertEqual(isValid, true)
    }
    
    func test_email_when_invalid() {
        textField.text = mockInvalidEmail
        let isValid = textField.fieldValidate(typeField: .email)
        XCTAssertFalse(isValid)
    }
    
    func test_email_when_nil() {
        textField.text = ""
        let isValid = textField.fieldValidate(typeField: .email)
        XCTAssertFalse(isValid)
    }
    
    func test_phone_when_valid() {
        textField.text = mockValidPhone
        let isValid = textField.fieldValidate(typeField: .telNumber)
        XCTAssertEqual(isValid, true)
    }
    
    func test_phone_when_invalid() {
        textField.text = mockInvalidPhone
        let isValid = textField.fieldValidate(typeField: .telNumber)
        XCTAssertEqual(isValid, false)
    }
    
    func test_phone_when_nil() {
        textField.text = ""
        let isValid = textField.fieldValidate(typeField: .telNumber)
        XCTAssertEqual(isValid, false)
    }
    
    func test_null() {
        let isValid = textField.fieldValidate(typeField: .null)
        XCTAssertFalse(isValid)
    }
    
    func test_phoneformat_is_valid() {
        let isValid = ValidateUtil.phoneFormat(stringPhone: mockOnlyNumberPhone)
        XCTAssertEqual(isValid, mockValidPhone)
    }
    
    func test_phoneformat_is_invalid() {
        let isValid = ValidateUtil.phoneFormat(stringPhone: mockNotOnlyNumberPhone)
        XCTAssertNotEqual(isValid, mockValidPhone)
    }
    
    func test_get_only_digits() {
        let isValid = mockNotOnlyNumberPhone.getOnlyDigits()
        XCTAssertEqual(isValid, "11988255967")
    }
    
}
