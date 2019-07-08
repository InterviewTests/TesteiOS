//
// StringTests.swift
// SantanderChallengeTests
//
// Created for SantanderChallenge on 08/07/19.
//

import XCTest

class StringTests: XCTestCase {
    
    func testRemoveNonDigitCharacters() {
        // Arrange
        let source = "1!2@3#4$5%6^"
        let target = "123456"
        
        // Act
        let result = source.removingNonDigitCharacters
        
        // Assert
        XCTAssertEqual(result, target)
    }
    
    func testValidEmail() {
        
        // Arrange
        let source = "luiz@mail.com"
        
        // Act & Assert
        XCTAssertTrue(source.validEmail)
    }
    
    func testInvalidEmail() {
        // Arrange
        let source = "@invalid_email_format"
        
        // Act & Assert
        XCTAssertFalse(source.validEmail)
    }
}
