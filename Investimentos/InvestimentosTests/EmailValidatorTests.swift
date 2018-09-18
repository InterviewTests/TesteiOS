//
//  EmailValidatorTests.swift
//  InvestimentosTests
//
//  Created by Adolfho Athyla on 16/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import XCTest
@testable import Investimentos

class EmailValidatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testIncompleteEmail() {
        let email = "adofo.athyla"
        let result = Validators.isValidEmail(testStr: email)
        XCTAssertFalse(result)
    }
    
    func testCompleteEmail() {
        let email = "adolfo.athyla@gmail.com"
        let result = Validators.isValidEmail(testStr: email)
        XCTAssertTrue(result)
    }
    
}
