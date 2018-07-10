//
//  CellsAPITests.swift
//  TesteiOSTests
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import XCTest
@testable import TesteiOS

class CellsAPITests: XCTestCase
{
    // MARK: - Subject under test
    
    var sut: CellsAPI!
    var testCells: [Cell]!
    
    // MARK: - Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupCellsAPI()
    }
    
    override func tearDown()
    {
        resetCellsAPI()
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupCellsAPI()
    {
        sut = CellsAPI()
        
        testCells = [Seeds.Cells.text, Seeds.Cells.fieldText, Seeds.Cells.fieldPhone, Seeds.Cells.fieldEmail, Seeds.Cells.checkbox, Seeds.Cells.button]
        
        sut.cells = testCells
    }
    
    func resetCellsAPI()
    {
        sut.cells = []
        sut = nil
    }
    
    // MARK: - Test CRUD operations - Optional error
    
    func testFetchCellsShouldReturnListOfCells_OptionalError()
    {
        // Given
        
        // When
        var fetchedCells = [Cell]()
        var fetchCellsError: CellsStoreError?
        let expect = expectation(description: "Wait for fetchCells() to return")
        sut.fetchCells { (cells: [Cell], error: CellsStoreError?) -> Void in
            fetchedCells = cells
            fetchCellsError = error
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.0)
        
        // Then
        XCTAssertEqual(fetchedCells.count, testCells.count, "fetchCells() should return a list of cells")
        for cell in fetchedCells {
            XCTAssert(testCells.contains(cell), "Fetched cells should match the cells in the data store")
        }
        XCTAssertNil(fetchCellsError, "fetchCells() should not return an error")
    }
    
    func testFetchCellShouldReturnCell_OptionalError()
    {
        // Given
        let cellToFetch = testCells.first!
        
        // When
        var fetchedCell: Cell?
        var fetchCellError: CellsStoreError?
        let expect = expectation(description: "Wait for fetchCell() to return")
        sut.fetchCell(id: cellToFetch.id) { (cell: Cell?, error: CellsStoreError?) -> Void in
            fetchedCell = cell
            fetchCellError = error
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.0)
        
        // Then
        XCTAssertEqual(fetchedCell, cellToFetch, "fetchCell() should return an cell")
        XCTAssertNil(fetchCellError, "fetchCell() should not return an error")
    }
    
    // MARK: - Test CRUD operations - Generic enum result type
    
    func testFetchCellsShouldReturnListOfCells_GenericEnumResultType()
    {
        // Given
        
        // When
        var fetchedCells = [Cell]()
        var fetchCellsError: CellsStoreError?
        let expect = expectation(description: "Wait for fetchCells() to return")
        sut.fetchCells { (result: CellsStoreResult<[Cell]>) -> Void in
            switch (result) {
            case .Success(let cells):
                fetchedCells = cells
            case .Failure(let error):
                fetchCellsError = error
                XCTFail("fetchCells() should not return an error: \(error)")
            }
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.0)
        
        // Then
        XCTAssertEqual(fetchedCells.count, testCells.count, "fetchCells() should return a list of cells")
        for cell in fetchedCells {
            XCTAssert(testCells.contains(cell), "Fetched cells should match the cells in the data store")
        }
        XCTAssertNil(fetchCellsError, "fetchCells() should not return an error")
    }
    
    func testFetchCellShouldReturnCell_GenericEnumResultType()
    {
        // Given
        let cellToFetch = testCells.first!
        
        // When
        var fetchedCell: Cell?
        var fetchCellError: CellsStoreError?
        let expect = expectation(description: "Wait for fetchCell() to return")
        sut.fetchCell(id: cellToFetch.id) { (result: CellsStoreResult<Cell>) -> Void in
            switch (result) {
            case .Success(let cell):
                fetchedCell = cell
            case .Failure(let error):
                fetchCellError = error
                XCTFail("fetchCell() should not return an error: \(error)")
            }
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.0)
        
        // Then
        XCTAssertEqual(fetchedCell, cellToFetch, "fetchCell() should return an cell")
        XCTAssertNil(fetchCellError, "fetchCell() should not return an error")
    }
    
    // MARK: - Test CRUD operations - Inner closure
    
    func testFetchCellsShouldReturnListOfCells_InnerClosure()
    {
        // Given
        
        // When
        var fetchedCells = [Cell]()
        var fetchCellsError: CellsStoreError?
        let expect = expectation(description: "Wait for fetchCells() to return")
        sut.fetchCells { (cells: () throws -> [Cell]) -> Void in
            do {
                fetchedCells = try cells()
            } catch let error as CellsStoreError {
                fetchCellsError = error
            } catch {}
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.0)
        
        // Then
        XCTAssertEqual(fetchedCells.count, testCells.count, "fetchCells() should return a list of cells")
        for cell in fetchedCells {
            XCTAssert(testCells.contains(cell), "Fetched cells should match the cells in the data store")
        }
        XCTAssertNil(fetchCellsError, "fetchCells() should not return an error")
    }
    
    func testFetchCellShouldReturnCell_InnerClosure()
    {
        // Given
        let cellToFetch = testCells.first!
        
        // When
        var fetchedCell: Cell?
        var fetchCellError: CellsStoreError?
        let expect = expectation(description: "Wait for fetchCell() to return")
        sut.fetchCell(id: cellToFetch.id) { (cell: () throws -> Cell?) -> Void in
            do {
                fetchedCell = try cell()
            } catch let error as CellsStoreError {
                fetchCellError = error
            } catch {}
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.0)
        
        // Then
        XCTAssertEqual(fetchedCell, cellToFetch, "fetchCell() should return an cell")
        XCTAssertNil(fetchCellError, "fetchCell() should not return an error")
    }
}

