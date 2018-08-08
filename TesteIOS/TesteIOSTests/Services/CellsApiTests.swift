//
//  CellsApiTests.swift
//  TesteIOSTests
//
//  Created by Developer RedFox on 07/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

@testable import TesteIOS
import XCTest

class CellsApiTests: XCTestCase {
    
    var sut: CellsApi!
    
    //    MARK: - Test Lifecycle
    override func setUp() {
        super.setUp()
        
        setupCellsApi()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //    MARK: - Test Setup
    func setupCellsApi(){
        sut = CellsApi()
        
    }
    
    //MARK: - Test
    func testFetchShouldReturnCells(){
        var fetchedCells: [CellModel] = []
        var fetchError: CellsStoreError?
        let expect = expectation(description: "Wait for fetch Cells")
        
        sut.fetchCells { (cells, error) in
            fetchedCells = cells
            fetchError = error
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 5.0)
        
        XCTAssert(fetchedCells.count > 0, "fetchCells() should not return an empty array")
        XCTAssertNil(fetchError, "fetchCells() should not return an error")
    }
    
}
