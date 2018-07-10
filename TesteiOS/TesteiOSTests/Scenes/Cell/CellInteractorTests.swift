//
//  CellInteractorTests.swift
//  TesteiOSTests
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import XCTest
@testable import TesteiOS

class CellsInteractorTests: XCTestCase {
    // MARK: - Subject under test
    
    var sut: CellsInteractor!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupCellsInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupCellsInteractor() {
        sut = CellsInteractor()
    }
    
    // MARK: - Test doubles
    
    class CellsPresentationLogicSpy: CellsPresentationLogic {
        // MARK: Method call expectations
        
        var presentFetchedCellsCalled = false
        
        // MARK: Spied methods
        
        func presentFetchedCells(response: Cells.FetchCells.Response) {
            presentFetchedCellsCalled = true
        }
    }
    
    class CellsWorkerSpy: CellsWorker {
        // MARK: Method call expectations
        
        var fetchCellsCalled = false
        
        // MARK: Spied methods
        
        override func fetchCells(completionHandler: @escaping ([Cell]) -> Void) {
            fetchCellsCalled = true
            completionHandler([Seeds.Cells.text, Seeds.Cells.fieldText])
        }
    }
    
    // MARK: - Tests
    
    func testFetchCellsShouldAskCellsWorkerToFetchCellsAndPresenterToFormatResult() {
        // Given
        let cellsPresentationLogicSpy = CellsPresentationLogicSpy()
        sut.presenter = cellsPresentationLogicSpy
        let cellsWorkerSpy = CellsWorkerSpy(cellsStore: CellsAPI())
        sut.cellsWorker = cellsWorkerSpy
        
        // When
        let request = Cells.FetchCells.Request()
        sut.fetchCells(request: request)
        
        // Then
        XCTAssert(cellsWorkerSpy.fetchCellsCalled, "FetchCells() should ask CellsWorker to fetch cells")
        XCTAssert(cellsPresentationLogicSpy.presentFetchedCellsCalled, "FetchCells() should ask presenter to format cells result")
    }
}
