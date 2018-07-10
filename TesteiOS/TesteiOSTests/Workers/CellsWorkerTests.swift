//
//  CellsWorkerTests.swift
//  TesteiOSTests
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import XCTest
@testable import TesteiOS

class CellsWorkerTests: XCTestCase {
    // MARK: - Subject under test
    
    var sut: CellsWorker!
    static var testCells: [Cell]!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupCellsWorker()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupCellsWorker() {
        sut = CellsWorker(cellsStore: CellsMemStoreSpy())
        
        CellsWorkerTests.testCells = [Seeds.Cells.text, Seeds.Cells.fieldText]
    }
    
    // MARK: - Test doubles
    
    class CellsMemStoreSpy: CellsAPI {
        // MARK: Method call expectations
        
        var fetchCellsCalled = false
        
        // MARK: Spied methods
        
        override func fetchCells(completionHandler: @escaping (() throws -> [Cell]) -> Void) {
            fetchCellsCalled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                completionHandler { () -> [Cell] in
                    return CellsWorkerTests.testCells
                }
            }
        }
    }
    
    // MARK: - Tests
    
    func testFetchCellsShouldReturnListOfCells() {
        // Given
        let cellsMemStoreSpy = sut.cellsStore as! CellsMemStoreSpy
        
        // When
        var fetchedCells = [Cell]()
        let expect = expectation(description: "Wait for fetchCells() to return")
        sut.fetchCells { (cells) in
            fetchedCells = cells
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.1)
        
        // Then
        XCTAssert(cellsMemStoreSpy.fetchCellsCalled, "Calling fetchCells() should ask the data store for a list of cells")
        XCTAssertEqual(fetchedCells.count, CellsWorkerTests.testCells.count, "fetchCells() should return a list of cells")
        for cell in fetchedCells {
            XCTAssert(CellsWorkerTests.testCells.contains(cell), "Fetched cells should match the cells in the data store")
        }
    }
}

