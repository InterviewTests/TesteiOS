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
    private var baseValidPhoneNumbers: [String]!
    private var baseInvalidPhoneNumbers: [String]!

    override func setUp() {
        super.setUp()
        rule = RulePhoneNumber()
        baseValidPhoneNumbers = ["(31) 4633-9632",
                                 "(31) 9633-9632"]
        
        baseInvalidPhoneNumbers = ["(31) 9484-82080",
                                   "(11)9678-07500",
                                   "+55 (12) 1212-1212",
                                   "+55 (021 12) 91212-2124",
                                   "(12) 9 21212-12124",
                                   "1212-1124",
                                   "12121124",
                                   "12956789123",
                                   " "]
        
        testRulePhoneNumberAllowsEmpty()
        testRulePhoneNumberNotAllowsEmpty()
    }

    override func tearDown() {
        rule = nil
        super.tearDown()
    }
    
    func testRulePhoneNumberAllowsEmpty() {
        rule.allowsEmpty = true
        let validPhoneNumbers = baseValidPhoneNumbers + [""]

        validPhoneNumbers.forEach { number in
            XCTAssertNil(rule.isValid(value: number))
        }
        
        baseInvalidPhoneNumbers.forEach { number in
            XCTAssertNotNil(rule.isValid(value: number))
        }
    }
    
    func testRulePhoneNumberNotAllowsEmpty() {
        rule.allowsEmpty = false
        
        baseValidPhoneNumbers.forEach { number in
            XCTAssertNil(rule.isValid(value: number))
        }
        
        let invalidPhoneNumbers = baseInvalidPhoneNumbers + [""]

        invalidPhoneNumbers.forEach { number in
            XCTAssertNotNil(rule.isValid(value: number))
        }
    }
}
