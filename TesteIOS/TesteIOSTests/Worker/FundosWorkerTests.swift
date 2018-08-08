//
//  FundosWorkerTests.swift
//  TesteIOSTests
//
//  Created by Developer RedFox on 07/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

@testable import TesteIOS
import XCTest

class FundosWorkerTests: XCTestCase {
    var sut: FundosWorker!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        setupFundosWorker()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //    MARK: - Test Setup
    func setupFundosWorker(){
        sut = FundosWorker(fundosStore: FundosApiSpy())
    }
    
    //    MARK: - TestDoubles
    class FundosApiSpy: FundsApi {
        var fetchFundoCalled = false
        
        //        MARK: - Spied methods
        override func fetchFundo(completionHandler: @escaping (FundModel?, FundosStoreError?) -> Void) {
            fetchFundoCalled = true
            
            super.fetchFundo { (fund, error) in
                completionHandler(fund, error)
            }
        }
    }
    
    //    MARK: - Tests
    func fetchCellsShoudlReturnListOfCells(){
        let fundosApiSpy = sut.fundosStore as! FundosApiSpy
        
        var fetchFund: FundModel?
        var fetchError: FundosStoreError?
        let expect = expectation(description: "Wait for fetchFund()")
        sut.fetchFundo { (fund, error) in
            fetchFund = fund
            fetchError = error
            expect.fulfill()
        }
        waitForExpectations(timeout: 5.0)
        
        XCTAssert(fundosApiSpy.fetchFundoCalled, "Calling fetchFund() should ask the API for a list of cells")
        XCTAssertNotNil(fetchFund, "fetchFund() should not return nil")
        XCTAssertNil(fetchError, "fetchFund() should not return an error")
    }
}
