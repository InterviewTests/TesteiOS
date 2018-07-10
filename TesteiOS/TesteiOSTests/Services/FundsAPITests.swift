//
//  FundsAPITests.swift
//  TesteiOSTests
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import XCTest
@testable import TesteiOS

class FundsAPITests: XCTestCase
{
    // MARK: - Subject under test
    
    var sut: FundsAPI!
    var testFunds: [Fund]!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupFundsAPI()
    }
    
    override func tearDown() {
        resetFundsAPI()
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupFundsAPI() {
        sut = FundsAPI()
        
        testFunds = [Seeds.Funds.fund]
        
        sut.funds = testFunds
    }
    
    func resetFundsAPI() {
        sut.funds = []
        sut = nil
    }
    
    // MARK: - Test Fetch operations - Optional error
    
    func testFetchFundsShouldReturnListOfFunds_OptionalError() {
        // Given
        
        // When
        var fetchedFunds = [Fund]()
        var fetchFundsError: FundsStoreError?
        let expect = expectation(description: "Wait for fetchFunds() to return")
        sut.fetchFunds { (funds: [Fund], error: FundsStoreError?) -> Void in
            fetchedFunds = funds
            fetchFundsError = error
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.0)
        
        // Then
        XCTAssertEqual(fetchedFunds.count, testFunds.count, "fetchFunds() should return a list of funds")
        for fund in fetchedFunds {
            XCTAssert(testFunds.contains(fund), "Fetched funds should match the funds in the data store")
        }
        XCTAssertNil(fetchFundsError, "fetchFunds() should not return an error")
    }
    
    func testFetchFundShouldReturnFund_OptionalError() {
        // Given
        let fundToFetch = testFunds.first!
        
        // When
        var fetchedFund: Fund?
        var fetchFundError: FundsStoreError?
        let expect = expectation(description: "Wait for fetchFund() to return")
        sut.fetchFund() { (fund: Fund?, error: FundsStoreError?) -> Void in
            fetchedFund = fund
            fetchFundError = error
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.0)
        
        // Then
        XCTAssertEqual(fetchedFund, fundToFetch, "fetchFund() should return an fund")
        XCTAssertNil(fetchFundError, "fetchFund() should not return an error")
    }
    
    // MARK: - Test Fetch operations - Generic enum result type
    
    func testFetchFundsShouldReturnListOfFunds_GenericEnumResultType() {
        // Given
        
        // When
        var fetchedFunds = [Fund]()
        var fetchFundsError: FundsStoreError?
        let expect = expectation(description: "Wait for fetchFunds() to return")
        sut.fetchFunds { (result: FundsStoreResult<[Fund]>) -> Void in
            switch (result) {
            case .Success(let funds):
                fetchedFunds = funds
            case .Failure(let error):
                fetchFundsError = error
                XCTFail("fetchFunds() should not return an error: \(error)")
            }
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.0)
        
        // Then
        XCTAssertEqual(fetchedFunds.count, testFunds.count, "fetchFunds() should return a list of funds")
        for fund in fetchedFunds {
            XCTAssert(testFunds.contains(fund), "Fetched funds should match the funds in the data store")
        }
        XCTAssertNil(fetchFundsError, "fetchFunds() should not return an error")
    }
    
    func testFetchFundShouldReturnFund_GenericEnumResultType() {
        // Given
        let fundToFetch = testFunds.first!
        
        // When
        var fetchedFund: Fund?
        var fetchFundError: FundsStoreError?
        let expect = expectation(description: "Wait for fetchFund() to return")
        sut.fetchFund() { (result: FundsStoreResult<Fund>) -> Void in
            switch (result) {
            case .Success(let fund):
                fetchedFund = fund
            case .Failure(let error):
                fetchFundError = error
                XCTFail("fetchFund() should not return an error: \(error)")
            }
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.0)
        
        // Then
        XCTAssertEqual(fetchedFund, fundToFetch, "fetchFund() should return an fund")
        XCTAssertNil(fetchFundError, "fetchFund() should not return an error")
    }
    
    // MARK: - Test Fetch operations - Inner closure
    
    func testFetchFundsShouldReturnListOfFunds_InnerClosure() {
        // Given
        
        // When
        var fetchedFunds = [Fund]()
        var fetchFundsError: FundsStoreError?
        let expect = expectation(description: "Wait for fetchFunds() to return")
        sut.fetchFunds { (funds: () throws -> [Fund]) -> Void in
            do {
                fetchedFunds = try funds()
            } catch let error as FundsStoreError {
                fetchFundsError = error
            } catch {}
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.0)
        
        // Then
        XCTAssertEqual(fetchedFunds.count, testFunds.count, "fetchFunds() should return a list of funds")
        for fund in fetchedFunds {
            XCTAssert(testFunds.contains(fund), "Fetched funds should match the funds in the data store")
        }
        XCTAssertNil(fetchFundsError, "fetchFunds() should not return an error")
    }
    
    func testFetchFundShouldReturnFund_InnerClosure() {
        // Given
        let fundToFetch = testFunds.first!
        
        // When
        var fetchedFund: Fund?
        var fetchFundError: FundsStoreError?
        let expect = expectation(description: "Wait for fetchFund() to return")
        sut.fetchFund() { (fund: () throws -> Fund?) -> Void in
            do {
                fetchedFund = try fund()
            } catch let error as FundsStoreError {
                fetchFundError = error
            } catch {}
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.0)
        
        // Then
        XCTAssertEqual(fetchedFund, fundToFetch, "fetchFund() should return an fund")
        XCTAssertNil(fetchFundError, "fetchFund() should not return an error")
    }
}


