//
//  CellPresenterTests.swift
//  TesteiOSTests
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import XCTest
@testable import TesteiOS

class CellsPresenterTests: XCTestCase
{
    // MARK: - Subject under test
    
    var sut: CellsPresenter!
    
    // MARK: - Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupCellsPresenter()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupCellsPresenter()
    {
        sut = CellsPresenter()
    }
    
    // MARK: - Test doubles
    
    class CellsDisplayLogicSpy: CellsDisplayLogic
    {
        // MARK: Method call expectations
        
        var displayFetchedCellsCalled = false
        
        // MARK: Argument expectations
        
        var viewModel: Cells.FetchCells.ViewModel!
        
        // MARK: Spied methods
        
        func displayFetchedCells(viewModel: Cells.FetchCells.ViewModel)
        {
            displayFetchedCellsCalled = true
            self.viewModel = viewModel
        }
    }
    
    // MARK: - Tests
    
    func testPresentFetchedCellsShouldFormatFetchedCellsForDisplay()
    {
        // Given
        let listCellsDisplayLogicSpy = CellsDisplayLogicSpy()
        sut.viewController = listCellsDisplayLogicSpy
        
        // When
        var text = Seeds.Cells.text
        text.message = "Um texto informativo para exibição"
        let cells = [text]
        
        let response = Cells.FetchCells.Response(cells: cells)
        sut.presentFetchedCells(response: response)
        
        // Then
        let displayedCells = listCellsDisplayLogicSpy.viewModel.displayedCells
        for displayedCell in displayedCells {
            XCTAssertEqual(displayedCell.id, 1, "Presenting fetched cells should properly format cell ID")
            XCTAssertEqual(displayedCell.message, "Um texto informativo para exibição", "Presenting fetched cells should properly format cell date")
        }
    }
    
    func testPresentFetchedCellsShouldAskViewControllerToDisplayFetchedCells()
    {
        // Given
        let listCellsDisplayLogicSpy = CellsDisplayLogicSpy()
        sut.viewController = listCellsDisplayLogicSpy
        
        // When
        let cells = [Seeds.Cells.text]
        let response = Cells.FetchCells.Response(cells: cells)
        sut.presentFetchedCells(response: response)
        
        // Then
        XCTAssert(listCellsDisplayLogicSpy.displayFetchedCellsCalled, "Presenting fetched cells should ask view controller to display them")
    }
}

