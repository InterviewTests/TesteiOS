//
//  FormPresenterTests.swift
//  FinFormTests
//
//  Created by Gustavo on 26/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

@testable import FinForm
import XCTest

class FormPresenterTests: XCTestCase
{
    // MARK: - Subject under test
    
    var sut: FormPresenter!
    
    // MARK: - Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupFormPresenter()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupFormPresenter()
    {
        sut = FormPresenter()
    }
    
    // MARK: - Test doubles
    
    class FormDisplayLogicSpy: FormDisplayLogic
    {
        // MARK: Method call expectations
        
        var displayFetchedCellsCalled = false
        var displayShowHideCellCalled = false
        var displayValidationResultCalled = false
        var displayRestartCalled = false
        
        // MARK: Argument expectations
        
        var fetchCellsViewModel: Form.FetchCells.ViewModel!
        var showHideCellViewModel: Form.ShowHideCell.ViewModel!
        var validateViewModel: Form.Validate.ViewModel!
        var restartViewModel: Form.Restart.ViewModel!
        
        func displayFetchedCells(viewModel: Form.FetchCells.ViewModel) {
            displayFetchedCellsCalled = true
            self.fetchCellsViewModel = viewModel
        }
        
        func displayShowHideCell(viewModel: Form.ShowHideCell.ViewModel) {
            displayShowHideCellCalled = true
            self.showHideCellViewModel = viewModel
        }
        
        func displayValidationResult(viewModel: Form.Validate.ViewModel) {
            displayValidationResultCalled = true
            self.validateViewModel = viewModel
        }
        
        func displayRestart(viewModel: Form.Restart.ViewModel) {
            displayRestartCalled = true
            self.restartViewModel = viewModel
        }
        
    }
    
    // MARK: - Tests
    
    func testPresentFetchedCellsShouldFormatFetcheCellsForDisplay()
    {
        // Given
        let formDisplayLogicSpy = FormDisplayLogicSpy()
        sut.viewController = formDisplayLogicSpy
        
        // When
        let response = Form.FetchCells.Response(arrayMetaData: [Seeds.CellsMetaData.first,Seeds.CellsMetaData.second,Seeds.CellsMetaData.third], noInternt: false)
        sut.presentFetchedCells(response: response)
        
        // Then
        let arrayCellMetaData = formDisplayLogicSpy.fetchCellsViewModel.cellsMetaData
        
        XCTAssertTrue(arrayCellMetaData.count == 1, "Presenting fetched cells meta data should filter hidden cells")
    }
    
    func testPresentFetchedCellsShouldAskViewControllerToDisplayFetchedCells()
    {
        // Given
        let formDisplayLogicSpy = FormDisplayLogicSpy()
        sut.viewController = formDisplayLogicSpy
        
        // When
        let arrayCellMetaData = [Seeds.CellsMetaData.first]
        let response = Form.FetchCells.Response(arrayMetaData: arrayCellMetaData, noInternt: false)
        sut.presentFetchedCells(response: response)
        
        // Then
        XCTAssert(formDisplayLogicSpy.displayFetchedCellsCalled, "Presenting fetched cells meta data should ask view controller to display them")
    }
    
    func testShowHideCellShouldAskViewControllerToShowHideCell()
    {
        // Given
        let formDisplayLogicSpy = FormDisplayLogicSpy()
        sut.viewController = formDisplayLogicSpy
        
        // When
        let response = Form.ShowHideCell.Response.init(cellMetaData: Seeds.CellsMetaData.first, index: 0, show: true)
        sut.showHideCell(response: response)
        
        // Then
        XCTAssert(formDisplayLogicSpy.displayShowHideCellCalled, "Show hide cell should ask view controller to display the cell")
    }
}
