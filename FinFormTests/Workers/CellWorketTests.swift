//
//  CellWorketTests.swift
//  FinFormTests
//
//  Created by Gustavo on 20/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

@testable import FinForm
import XCTest

class CellWorkerTests: XCTestCase
{
    // MARK: - Subject under test
    
    var sut: CellWorker!
    static var testCells: [Cell]!
    
    // MARK: - Lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupCellWorker()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    //MARK: - Setup
    
    func setupCellWorker()
    {
        sut = CellWorker.init(cellEngine: CellRequesterSpy())
        
        CellWorkerTests.testCells = [Seeds.Cells.firstCell,Seeds.Cells.secondCell]
    }
    
    class CellRequesterSpy: CellRequester
    {
        
        var fetchCellsCalled:Bool = false
        
        override func fetchCells(completionHandler: @escaping FetchCellCompletionHandler) {
            fetchCellsCalled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                completionHandler(CellWorkerResult.Success(result: CellWorkerTests.testCells))
            }
        }
        
    }
    
    //MARK: - Cell Requester Spy Tests
    
    func testFetchCellsShouldReturnListOfCells(){
        // Given
        let cellRequesterSpy = sut.cellEngine as! CellRequesterSpy
        
        // When
        var fetchedCells = [Cell]()
        let expect = expectation(description: "Wait for fetchCells() to return")
        sut.fetchCells { (result) in
            switch result{
            case .Success(result: let cells):
                fetchedCells = cells
                break
            case .Failure(error: _):
                break
            }
            expect.fulfill()
        }
        waitForExpectations(timeout: 2.0)
        
        // Then
        XCTAssert(cellRequesterSpy.fetchCellsCalled, "Calling fetchCells() should ask the data store for a list of cells")
        XCTAssertEqual(fetchedCells.count, CellWorkerTests.testCells.count, "fetchCells() should return a list of cells")
        for cell in fetchedCells {
            XCTAssert(CellWorkerTests.testCells.contains(cell), "Fetched cells should match the cells in the data store")
        }
    }
}
