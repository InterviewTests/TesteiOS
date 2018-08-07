//
//  CellsWorkerTests.swift
//  TesteIOSTests
//
//  Created by Developer RedFox on 07/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

@testable import TesteIOS
import XCTest

class CellsWorkerTests: XCTestCase {
    
    var sut: CellsWorker!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        setupCellsWorker()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //    MARK: - Test Setup
    func setupCellsWorker(){
        sut = CellsWorker(cellsStore: CellsApiSpy())
    }
    
    //    MARK: - TestDoubles
    class CellsApiSpy: CellsApi {
        var fetchCellsCalled = false
        
        //        MARK: - Spied methods
        override func fetchCells(completionHandler: @escaping ([CellModel], CellsStoreError?) -> Void) {
            fetchCellsCalled = true
            
            super.fetchCells { (cells, error) in
                completionHandler(cells, error)
            }
        }
    }
    
    //    MARK: - Tests
    func fetchCellsShoudlReturnListOfCells(){
        let cellsApiSpy = sut.cellsStore as! CellsApiSpy
        
        var fetchedCells: [CellModel] = []
        var fetchError: CellsStoreError?
        let expect = expectation(description: "Wait for fetchCells()")
        sut.fetchCells { (cells, error) in
            fetchedCells = cells
            fetchError = error
            expect.fulfill()
        }
        waitForExpectations(timeout: 5.0)
        
        XCTAssert(cellsApiSpy.fetchCellsCalled, "Calling fetchCells() should ask the API for a list of cells")
        XCTAssert(fetchedCells.count > 0, "fetchCells() should not return an empty array")
        XCTAssertNil(fetchError, "fetchCells() should not return an error")
    }
}
