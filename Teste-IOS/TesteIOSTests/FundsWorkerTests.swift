//
//  FundsWorkerTests.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 29/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//


@testable import TesteIOS
import XCTest

class FundsWorkerTests: XCTestCase {
    // MARK: Subject under test
  
    var sut: FundsWorker!
  
    // MARK: Test lifecycle
  
    override func setUp() {
        super.setUp()
        setupFundsWorker()
    }
  
    override func tearDown() {
        super.tearDown()
    }
  
    // MARK: Test setup
  
    func setupFundsWorker() {
        sut = FundsWorker()
    }
  
    // MARK: Tests
  
    func test_request_success() {
        // Given
        let url = "https://floating-mountain-50292.herokuapp.com/fund.json"
        let promisse = expectation(description: "get funds")
        // When
        sut.fetchForm(url: url, success: { (response) in
            if response.screen != nil {
                promisse.fulfill()
            } else {
                XCTFail("get error")
            }
        }, failure: { (response) in
            XCTFail("get error")
        })
        
        // Then
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_request_error() {
        // Given
        let url = "https://urlwitherror.herokuapp.com/fund.json"
        let promisse = expectation(description: "get funds")
        var error: Error?
        // When
        sut.fetchForm(url: url, success: { (response) in
            XCTFail("get error")
        }, failure: { (response) in
            error = response.error!
            promisse.fulfill()
        })
        
        // Then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(error)
    }
}
