//
//  FieldValidationTests.swift
//  Santander-TestTests
//
//  Created by Matheus Ribeiro on 20/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import XCTest
@testable import Santander_Test

class FieldValidationTests: XCTestCase {
    
    func testCorrectPhoneNumberValidation() {
        let numbersList = ["(99) 99123-5232", "(92) 8485-2719", "(91) 8456-2345", "(92) 99340-9876", "(93) 8558-0950"]
        
        for number in numbersList {
            let isValidNumber = FieldValidation.isValid(phoneNumber: number)
            XCTAssertTrue(isValidNumber, number)
        }
    }
    
    func testWrongPhoneNumberValidation() {
        let numbersList = [
            "(9) 99123-5232", "(92)8485-2719", "(91) 456-2345",
            "(92) 9934-09876", "9385580950", "(92) 991199239",
            "23) 9119-3949", "(92) 9138-2847"
        ]
        
        for number in numbersList {
            let isValidNumber = FieldValidation.isValid(phoneNumber: number)
            XCTAssertFalse(isValidNumber, number)
        }
    }
    
    func testCorrectEmailValidation() {
        let emailList = ["name@mail.com", "name@mail.com.br", "name@mailmail.com.br", "namename@mail.com.br.br"]
        
        for email in emailList {
            let isValidEmail = FieldValidation.isValid(email: email)
            XCTAssertTrue(isValidEmail, email)
        }
    }
    
    func testWrongEmailValidation() {
        
        let emailList = ["wrong@mail", "wrong@mail.", "wrong@mail.c", "@mail.com", "wrong.mail"]
        
        for email in emailList {
            let isValidEmail = FieldValidation.isValid(email: email)
            XCTAssertFalse(isValidEmail, email)
        }
    }
    
    func testConvertToPhoneNumberFormat() {
        
        var textFormatted = "1".convertToPhoneNumberFormat()
        XCTAssertEqual(textFormatted, "(1")
        
        textFormatted = "12".convertToPhoneNumberFormat()
        XCTAssertEqual(textFormatted, "(12")
        
        textFormatted = "123".convertToPhoneNumberFormat()
        XCTAssertEqual(textFormatted, "(12) 3")
        
        textFormatted = "1234".convertToPhoneNumberFormat()
        XCTAssertEqual(textFormatted, "(12) 34")
        
        textFormatted = "12345".convertToPhoneNumberFormat()
        XCTAssertEqual(textFormatted, "(12) 345")
        
        textFormatted = "123456".convertToPhoneNumberFormat()
        XCTAssertEqual(textFormatted, "(12) 3456")
        
        textFormatted = "1234567".convertToPhoneNumberFormat()
        XCTAssertEqual(textFormatted, "(12) 34567")
        
        textFormatted = "12345678".convertToPhoneNumberFormat()
        XCTAssertEqual(textFormatted, "(12) 34567-8")
        
        textFormatted = "123456789".convertToPhoneNumberFormat()
        XCTAssertEqual(textFormatted, "(12) 34567-89")
        
        textFormatted = "1234567890".convertToPhoneNumberFormat()
        XCTAssertEqual(textFormatted, "(12) 3456-7890")
        
        textFormatted = "12345678901".convertToPhoneNumberFormat()
        XCTAssertEqual(textFormatted, "(12) 34567-8901")
        
    }
    
}
