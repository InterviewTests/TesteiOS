//
//  FundosApiTests.swift
//  TesteIOSTests
//
//  Created by Developer RedFox on 07/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

@testable import TesteIOS
import XCTest

class FundosApiTests: XCTestCase {
    
    var sut: FundsApi!
    var testFunds: [FundModel]!
    
    //    MARK: - Test Lifecycle
    
    override func setUp() {
        super.setUp()
        
        setupFundsApi()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //    MARK: - Test Setup
    func setupFundsApi(){
        sut = FundsApi()
        
    }
    
    //MARK: - Test
    func testFetchShouldReturnFund(){
        var fetchedFund: FundModel?
        var fetchFundError: FundosStoreError?
        let expect = expectation(description: "Wait for fetch Fund")
        
        sut.fetchFundo { (fund, error) in
            fetchedFund = fund
            fetchFundError = error
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 5.0)
        
        // Then
        XCTAssertNotNil(fetchedFund, "fetchFundo() should return a FundModel")
        XCTAssertNil(fetchFundError, "fetchFundo() should not return an error")
    }
}
