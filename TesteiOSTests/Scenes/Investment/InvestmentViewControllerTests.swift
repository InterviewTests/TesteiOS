//
//  InvestmentViewControllerTests.swift
//  TesteiOSTests
//
//  Created by Dafle Cardoso on 04/08/2018.
//  Copyright © 2018 Dafle Cardoso. All rights reserved.
//

import XCTest
@testable import TesteiOS

class InvestmentViewControllerTests: XCTestCase {
    
    var session:URLSession!
    
    override func setUp() {
        super.setUp()
        session = URLSession(configuration: .default)
    }
    
    override func tearDown() {
        session = nil
        super.tearDown()
    }
    
    func testRequestAPIInvestment() {
        
        let url = URL(string: "https://floating-mountain-50292.herokuapp.com/fund.json")
        
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        session.dataTask(with: url!) { (data, response, error) in
            
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
            
            }.resume()
        
        waitForExpectations(timeout: 30, handler: nil)
        
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    func testResultAPIInvestment() {
        
        RestAPI.fetchGenericObject(endPoint: "fund.json", onComplete: { (result:InvestimentResponse) in
            
            XCTAssertEqual(result.screen.title, "Fundos de investimento")
            
        }) { (apiError) in
            
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
