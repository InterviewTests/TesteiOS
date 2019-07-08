//
// EnvironmentManagerTests.swift
// SantanderChallengeTests
//
// Created for SantanderChallenge on 08/07/19.
//

import XCTest

class EnvironmentManagerTests: XCTestCase {
    
    func testIfIsDetectingEnvironment() {
        let environmentId = EnvironmentManager.shared.environmentId
        XCTAssertEqual(environmentId, EnvironmentIdentifier.development)
    }
    
    func testIfRetrivingKeyFromPlist() {
        // Arrange
        let target = "test_value"
        
        // Act
        let value: String = EnvironmentManager.shared.value(forKey: EnvironmentKey.test)!
        
        // Assert
        XCTAssertEqual(target, value)
    }
}
