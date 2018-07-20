//
//  CellRequesterTests.swift
//  FinFormTests
//
//  Created by Gustavo on 20/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

@testable import FinForm
import XCTest

class CellRequesterTests: XCTestCase
{
    // MARK: - Subject under test
    
    var sut: CellRequester!
    
    // MARK: - Lifecycle
    
    override func setUp()
    {
        sut = CellRequester()
        super.setUp()
    }
    
    override func tearDown()
    {
        sut = nil
        super.tearDown()
    }
    
    //MARK: - Tests
    
    func testFetchCellsShouldFetchCells(){
        //When
        
        var fetchCells:[Cell]?
        let fetchCellsExpectation = expectation(description: "Wait for fetchCells() to return")
        
        sut.fetchCells { (result) in
            switch result{
            case .Success(result: let cells):
                fetchCells = cells
                fetchCellsExpectation.fulfill()
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
                    XCTFail("fetchCells() return an error: \(error)")
                }
            }
        }
        waitForExpectations(timeout: 10.0)
        
        //Then
        
        XCTAssertNotNil(fetchCells, "fetchCells() should return a list of cells")
        if let fetchCells = fetchCells{
            XCTAssert(fetchCells.count > 0, "fetchCells() should return more than zero cells")
        }
    }
}
