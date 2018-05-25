//
//  TestFieldTest.swift
//  SantanderTestAppTests
//
//  Created by Frederico Franco on 20/05/18.
//  Copyright © 2018 Frederico Franco. All rights reserved.
//

import XCTest
@testable import SantanderTestApp

class MockValidator: TextFieldValidator {
    
    var maxTextLength: Int? = nil
    
    var handlerIsValidText: (String) -> Bool = { _ in 
        return true
    }
    
    func isValidText(_ text: String) -> Bool {
        return handlerIsValidText(text)
    }
}

class TestFieldModelTest: XCTestCase {
    
    var subject = TextFieldModel(title: "Nome", typedText: "Fred", validator: MockValidator(), isTextFieldActive: false)
    
    override func setUp() {
        super.setUp()
        
        subject = TextFieldModel(title: "Nome", typedText: "Fred", validator: MockValidator(), isTextFieldActive: false)
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    func testShouldCleanTypedText() {
        XCTAssertTrue(!subject.typedText.isEmpty)
        
        subject.clearTypedText()
        
        XCTAssertTrue(subject.typedText.isEmpty)
    }
    
    func testShouldNotAcceptInvalidTypedText() {
        let validator = MockValidator()
        validator.maxTextLength = 4
        
        var subject = TextFieldModel(title: "oi", typedText: "", validator: validator)
        let invalidText = "asasdasf"
        
        XCTAssertThrowsError(try subject.changeTypedText(with: invalidText))
    }
    
    func testShouldNotAcceptTypedTextWithSpaces() {
        let validator = MockValidator()
        validator.handlerIsValidText = {
            return !$0.contains("o")
        }
        
        var subject = TextFieldModel(title: "oi", typedText: "", validator: validator)
        let invalidText = "oi oi oi"
        
        XCTAssertNoThrow(try subject.changeTypedText(with: invalidText))
        
        XCTAssert(subject.typedText == invalidText)
        
        XCTAssertNoThrow(try subject.validateTypedText())
        
        XCTAssert(subject.validation.isValid() == false)
    }
    
}
