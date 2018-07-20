//
//  ScreenRequesterTests.swift
//  FinFormTests
//
//  Created by Gustavo on 20/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

@testable import FinForm
import XCTest

class ScreenRequesterTests: XCTestCase
{
    // MARK: - Subject under test
    
    var sut: ScreenRequester!
    
    // MARK: - Lifecycle
    
    override func setUp()
    {
        sut = ScreenRequester()
        super.setUp()
    }
    
    override func tearDown()
    {
        sut = nil
        super.tearDown()
    }
    
    //MARK: - Tests
    
    func testFetchScreenShouldFetchScreen(){
        //When
        
        var fetchScreen:Screen?
        let fetchScreenExpectation = expectation(description: "Wait for fetchScreen() to return")
        
        sut.fetchScreen { (result) in
            switch result{
            case .Success(result: let screen):
                fetchScreen = screen
                fetchScreenExpectation.fulfill()
            case .Failure(error: let error):
                switch error{
                case .RequestError(let requestError):
                    switch requestError{
                    case .NoInternetAcces:
                        XCTFail("fetchCells() needs internet access")
                    default:
                        XCTFail("fetchScreen() request return an error: \(requestError)")
                    }
                default:
                    XCTFail("fetchScreen() return an error: \(error)")
                }
//                switch error{
//                case .NoInternetAcces:
//                    XCTFail("fetchScreen() needs internet access")
//                default:
//                    XCTFail("fetchScreen() return an error: \(error)")
//                }
            }
        }
        waitForExpectations(timeout: 10.0)
        
        //Then
        
        XCTAssertNotNil(fetchScreen, "fetchScreen() should return a screen")
    }
}
