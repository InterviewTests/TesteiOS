//
//  StringExtensionsTests.swift
//  SantanderTests
//
//  Created by Orlando Amorim on 17/08/19.
//

import XCTest
@testable import Santander

class StringExtensionsTests: XCTestCase {
    
    // Normally, it can be argued that force unwrapping (!) should
    // be avoided, but in unit tests it can be a good idea for
    // properties (only!) in order to avoid unnecessary boilerplate.
    private var rule: RulePhoneNumber!

    override func setUp() {
        super.setUp()
        rule = RulePhoneNumber()
    }

    override func tearDown() {
        rule = nil
        super.tearDown()
    }
    
    // MARK: - Valid numbers allowing empty
    func testRuleValidPhoneNumberAllowingEmpty() {
        rule.allowsEmpty = true

        XCTAssertNil(rule.isValid(value: "(31) 4633-9632"), "Is valid number without digit 9")
        XCTAssertNil(rule.isValid(value: "(31) 99633-9632"), "Is valid number with digit 9")
        XCTAssertNil(rule.isValid(value: ""), "Is valid empty number")
    }
    
    // MARK: - Inalid numbers allowing empty
    func testRuleInvalidPhoneNumberAllowingEmpty() {
        rule.allowsEmpty = true
        
        XCTAssertNotNil(rule.isValid(value: "(31) 9484-82080"), "Is invalid phone number with 5 digits after -")
        XCTAssertNotNil(rule.isValid(value: "(11)9678-0750"), "Is invalid phone number without spacing after )")
        XCTAssertNotNil(rule.isValid(value: "(021 12) 91212-2124"), "Is invalid phone number with carrier code")
        XCTAssertNotNil(rule.isValid(value: "(12) 9 1212-1212"), "Is invalid phone number with spacing between the 9 digit and the rest of number")
        XCTAssertNotNil(rule.isValid(value: "1212-1124"), "Is invalid phone number without the state code")
        XCTAssertNotNil(rule.isValid(value: "319484-8208"), "Is invalid phone number without () between the state code")
        XCTAssertNotNil(rule.isValid(value: "3194848208"), "Is invalid phone number without () between the state code and - between numbers")
        XCTAssertNotNil(rule.isValid(value: " "), "Is invalid phone number with space")
    }
    
    
    // MARK: - Valid numbers not allowing empty
    func testRuleValidPhoneNumberNotAllowingEmpty() {
        rule.allowsEmpty = false
        
        XCTAssertNil(rule.isValid(value: "(31) 4633-9632"), "Is valid number without digit 9")
        XCTAssertNil(rule.isValid(value: "(31) 99633-9632"), "Is valid number with digit 9")
    }
    
    // MARK: - Invalid numbers not allowing empty
    func testRuleInvalidPhoneNumberNotAllowingEmpty() {
        rule.allowsEmpty = false
        
        XCTAssertNotNil(rule.isValid(value: "(31) 9484-82080"), "Is invalid phone number with 5 digits after -")
        XCTAssertNotNil(rule.isValid(value: "(11)9678-0750"), "Is invalid phone number without spacing after )")
        XCTAssertNotNil(rule.isValid(value: "(021 12) 91212-2124"), "Is invalid phone number with carrier code")
        XCTAssertNotNil(rule.isValid(value: "(12) 9 1212-1212"), "Is invalid phone number with spacing between the 9 digit and the rest of number")
        XCTAssertNotNil(rule.isValid(value: "1212-1124"), "Is invalid phone number without the state code")
        XCTAssertNotNil(rule.isValid(value: "319484-8208"), "Is invalid phone number without () between the state code")
        XCTAssertNotNil(rule.isValid(value: "3194848208"), "Is invalid phone number without () between the state code and - between numbers")
        XCTAssertNotNil(rule.isValid(value: " "), "Is invalid phone number with space")
        XCTAssertNotNil(rule.isValid(value: ""), "Is invalid empty number")
    }
}
