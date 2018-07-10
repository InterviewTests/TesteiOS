//
//  FundsWorkerTests.swift
//  TesteiOSTests
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import XCTest
@testable import TesteiOS

class FundsWorkerTests: XCTestCase {
    // MARK: - Subject under test
    
    var sut: FundsWorker!
    static var testFunds: [Fund]!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupFundsWorker()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupFundsWorker() {
        sut = FundsWorker(fundsStore: FundsMemStoreSpy())
        
        FundsWorkerTests.testFunds = [Seeds.Funds.fund]
    }
    
    // MARK: - Test doubles
    
    class FundsMemStoreSpy: FundsAPI {
        // MARK: Method call expectations
        
        var fetchFundsCalled = false
        
        // MARK: Spied methods
        
        override func fetchFunds(completionHandler: @escaping (() throws -> [Fund]) -> Void) {
            fetchFundsCalled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                completionHandler { () -> [Fund] in
                    return FundsWorkerTests.testFunds
                }
            }
        }
    }
    
    // MARK: - Tests
    
    func testFetchFundsShouldReturnListOfFunds() {
        // Given
        let fundsMemStoreSpy = sut.fundsStore as! FundsMemStoreSpy
        
        // When
        var fetchedFunds = [Fund]()
        let expect = expectation(description: "Wait for fetchFunds() to return")
        sut.fetchFunds { (funds) in
            fetchedFunds = funds
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.1)
        
        // Then
        XCTAssert(fundsMemStoreSpy.fetchFundsCalled, "Calling fetchFunds() should ask the data store for a list of funds")
        XCTAssertEqual(fetchedFunds.count, FundsWorkerTests.testFunds.count, "fetchFunds() should return a list of funds")
        for fund in fetchedFunds {
            XCTAssert(FundsWorkerTests.testFunds.contains(fund), "Fetched funds should match the funds in the data store")
        }
    }
}


