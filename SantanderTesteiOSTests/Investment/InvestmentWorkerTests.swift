//
//  InvestmentWorkerTests.swift
//  SantanderTesteiOSTests
//
//  Created by Diego Costa on 23/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import XCTest
@testable import SantanderTesteiOS

class InvestmentWorkerTests: XCTestCase {
    
    var worker : InvestmentWorker!
    
    
    override func setUp() {
        super.setUp()
        self.worker = InvestmentWorker()
    }
    
    func testScreenSuccessRequest() {
        var mockScreen = Screen()
        mockScreen.title = "Fundos de investimento"
        
        var screen : Screen!
        var allFunds : [Fundable]!
        
        let investmentWorkerExpectation = expectation(description: "Wait for investment worker fetchScreenInfo() to return")
        
        self.worker.fetchScreenInfo(completion: { response in
            screen = response.screen
            allFunds = response.screen.allFunds
            investmentWorkerExpectation.fulfill()
        }, failure: { error in
            
        })
        
        waitForExpectations(timeout: 2.0)
        
        //Then
        
        XCTAssertNotNil(allFunds, "AllFunds loaded")
        
        XCTAssertNotNil(screen, "ScreenInfo loaded")
        
        XCTAssertEqual(allFunds.count, screen.allFunds.count)
        
        XCTAssertEqual(mockScreen.title, screen.title)
    }
    
    func testScreenFailureRequest() {
        
        let investmentWorkerExpectation = expectation(description: "Wait for investment worker fetchScreenInfo() to return")
        
        self.worker.fetchScreenInfo(completion: { response in
            investmentWorkerExpectation.fulfill()
        }, failure: { fail in
            
            XCTAssertNotNil(fail, "Ocorreu um erro")
            
            investmentWorkerExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 2.0)
    }
}
