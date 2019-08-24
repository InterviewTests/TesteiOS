//
//  DomainValidationTest.swift
//  Tests
//
//  Created by Erika de Almeida Segatto on 21/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import XCTest
import Domain
@testable import TesteiOS

class DomainValidationTest: XCTestCase {

    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    
    func test_phoneCellValidation() {
        // Given
        let inputList = [
            ("0000000000", true),
            ("00000000000", true),
            ("00000000000".formatAsPhone(), true),
            ("(00) 00000-0000", true),
            ("(00) 00000-0000", true),
            ("(00)00000-0000", true),
            ("(00)0000-0000", true),
            ("000000000", false),
            ("000000000000", false),
            ("00 00000000".formatAsPhone(), true),
            ("00 00000000", false),
            ("0", false),
            ("a", false),
            ("aaaaaa0000000", false),
            ("", false),
            ("0000000000aaaa", false)
        ]
        
        for (index, input) in inputList.enumerated() {
            
            // When
            let isValid = FieldType.telNumber.isValid(input.0)
            
            // Then
            XCTAssertEqual(input.1, isValid, " at index \(index)")
        }
    }
    
    func test_textCellValidation() {
        // Given
        let inputList = [
            ("a", true),
            ("0", true),
            ("aabaohihihoihdogidugygdjvbl", true),
            ("-", true),
            ("", false)
        ]
        
        for (index, input) in inputList.enumerated() {
            
            // When
            let isValid = FieldType.text.isValid(input.0)
            
            // Then
            XCTAssertEqual(input.1, isValid, " at index \(index)")
        }
    }
    
    
    func test_emailCellValidation() {
        // Given
        let inputList = [
            ("a@b.com.br", true),
            ("m@aaaaaaa.com", true),
            ("@bbb.com.br", false),
            ("1@2.com", true),
            ("a@b.com.", false),
            ("", false)
        ]
        
        for (index, input) in inputList.enumerated() {
            
            // When
            let isValid = FieldType.email.isValid(input.0)
            
            // Then
            XCTAssertEqual(input.1, isValid, " at index \(index)")
        }
    }
}
