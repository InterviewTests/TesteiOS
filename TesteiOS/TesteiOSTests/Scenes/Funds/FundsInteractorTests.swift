//
//  FundsInteractorTests.swift
//  TesteiOSTests
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import XCTest
@testable import TesteiOS

class FundsInteractorTests: XCTestCase {
    // MARK: - Subject under test
    
    var sut: FundsInteractor!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupFundsInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupFundsInteractor() {
        sut = FundsInteractor()
    }
    
    // MARK: - Test doubles
    
    class FundsPresentationLogicSpy: FundsPresentationLogic {
        // MARK: Method call expectations
        
        var presentFetchedFundsCalled = false
        
        // MARK: Spied methods
        
        func presentFetchedFunds(response: Funds.FetchFunds.Response) {
            presentFetchedFundsCalled = true
        }
    }
    
    class FundsWorkerSpy: FundsWorker {
        // MARK: Method call expectations
        
        var fetchFundsCalled = false
        
        // MARK: Spied methods
        
        override func fetchFunds(completionHandler: @escaping ([Fund]) -> Void) {
            fetchFundsCalled = true
            completionHandler([Seeds.Funds.fund])
        }
    }
    
    // MARK: - Tests
    
    func testFetchFundsShouldAskFundsWorkerToFetchFundsAndPresenterToFormatResult() {
        // Given
        let fundsPresentationLogicSpy = FundsPresentationLogicSpy()
        sut.presenter = fundsPresentationLogicSpy
        let fundsWorkerSpy = FundsWorkerSpy(fundsStore: FundsAPI())
        sut.fundsWorker = fundsWorkerSpy
        
        // When
        let request = Funds.FetchFunds.Request()
        sut.fetchFunds(request: request)
        
        // Then
        XCTAssert(fundsWorkerSpy.fetchFundsCalled, "FetchFunds() should ask FundsWorker to fetch funds")
        XCTAssert(fundsPresentationLogicSpy.presentFetchedFundsCalled, "FetchFunds() should ask presenter to format funds result")
    }
}

