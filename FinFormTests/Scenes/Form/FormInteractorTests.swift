//
//  FormInteractorTests.swift
//  FinFormTests
//
//  Created by Gustavo on 24/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

@testable import FinForm
import XCTest

class FormInteractorTests: XCTestCase
{
    // MARK: - Subject under test
    
    var sut: FormInteractor!
    
    // MARK: - Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupFormInteractor()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupFormInteractor()
    {
        sut = FormInteractor()
        sut.arrayMetaData = [Seeds.CellsMetaData.first,Seeds.CellsMetaData.second,Seeds.CellsMetaData.third]
    }
    
    // MARK: - Test doubles
    
    class FormPresentationLogicSpy: FormPresentationLogic
    {
        
        // MARK: Method call expectations
        
        var presentFetchedCellsCalled = false
        var showHideCellCalled = false
        var validateCalled = false
        var restartCalled = false
        
        // MARK: Spied methods
        
        func presentFetchedCells(response: Form.FetchCells.Response) {
            presentFetchedCellsCalled = true
        }
        
        func showHideCell(response: Form.ShowHideCell.Response) {
            showHideCellCalled = true
        }
        
        func validate(response: Form.Validate.Response) {
            validateCalled = true
        }
        
        func restart(response: Form.Restart.Response) {
            restartCalled = true
        }
    }
    
    class CellWorkerSpy: CellWorker
    {
        // MARK: Method call expectations
        
        var fetchCellsCalled = false
        
        // MARK: Spied methods
        
        override func fetchCells(completionHandler: @escaping FetchCellCompletionHandler) {
            fetchCellsCalled = true
            completionHandler(CellWorkerResult.Success(result: [Seeds.Cells.firstCell,Seeds.Cells.secondCell]))
        }
    }
    
    class FormWorkerSpy: FormWorker
    {
        // MARK: Method call expectations
        
        var validateFormCalled:Bool = false
        var didSelectCalled:Bool = false
        var generateMetaDataArrayCalled:Bool = false
        var restartCellsMetaDataCalled:Bool = false
        
        // MARK: Spied methods
        
        override func validateForm(arrayMetaData:[CellMetaData]) -> CellMetaData?{
            validateFormCalled = true
            return Seeds.CellsMetaData.first
        }
        
        override func didSelect(cellMetaData:CellMetaData,arrayMetaData:[CellMetaData]) -> (cellMetaData:CellMetaData,index:Int,show:Bool){
            didSelectCalled = true
            return (Seeds.CellsMetaData.first,0,true)
        }
        
        override func generateMetaDataArray(cells:[Cell]) -> [CellMetaData]{
            generateMetaDataArrayCalled = true
            return [Seeds.CellsMetaData.first,Seeds.CellsMetaData.second,Seeds.CellsMetaData.third]
        }
        
        override func restartCellsMetaData(arrayMetaData:[CellMetaData]) -> [CellMetaData]{
            restartCellsMetaDataCalled = true
            return [Seeds.CellsMetaData.first,Seeds.CellsMetaData.second,Seeds.CellsMetaData.third]
        }
    }
    
    // MARK: - Tests
    
    func testFetchCellsShouldAskCellWorkerToFetchCellsAndFormWorkerToGenerateArrayAndPresenterToFormatResult()
    {
        // Given
        let formPresentationLogicSpy = FormPresentationLogicSpy()
        sut.presenter = formPresentationLogicSpy
        let cellsWorkerSpy = CellWorkerSpy(cellEngine: CellRequester())
        sut.cellWorker = cellsWorkerSpy
        let formWorkerSpy = FormWorkerSpy()
        sut.formWorker = formWorkerSpy
        
        // When
        let request = Form.FetchCells.Request()
        sut.fetchCells(request: request)
        
        // Then
        XCTAssert(cellsWorkerSpy.fetchCellsCalled, "FetchCells() should ask CellWorker to fetch cells")
        XCTAssert(formWorkerSpy.generateMetaDataArrayCalled, "FetchCells() should ask FormWorker to generate cells meta data array")
        XCTAssert(formPresentationLogicSpy.presentFetchedCellsCalled, "FetchCells() should ask presenter to format cells result")
    }
    
    func testShowHideCellShouldAskFormWorkerToModifyCellStateAndPresenterToFormatResult()
    {
        //Given
        let formPresentationLogicSpy = FormPresentationLogicSpy()
        sut.presenter = formPresentationLogicSpy
        let formWorkerSpy = FormWorkerSpy()
        sut.formWorker = formWorkerSpy
        
        // When
        let request = Form.ShowHideCell.Request.init(cellMetaData: Seeds.CellsMetaData.first, index: 0)
        sut.showHideCell(request: request)
        
        // Then
        XCTAssert(formWorkerSpy.didSelectCalled, "ShowHideCell() should ask FormWorker to modify cell to show hidden state")
        XCTAssert(formPresentationLogicSpy.showHideCellCalled, "ShowHideCell() should ask presenter to format modified cell")
    }
    
    func testValidateShouldAskFormWorkerToValidateArrayMetaDataAndPresenterToFormatResult()
    {
        //Given
        let formPresentationLogicSpy = FormPresentationLogicSpy()
        sut.presenter = formPresentationLogicSpy
        let formWorkerSpy = FormWorkerSpy()
        sut.formWorker = formWorkerSpy
        
        // When
        let request = Form.Validate.Request.init(arrayMetaData: [Seeds.CellsMetaData.first,Seeds.CellsMetaData.second,Seeds.CellsMetaData.third])
        sut.validate(request: request)
        
        // Then
        XCTAssert(formWorkerSpy.validateFormCalled, "Validate() should ask FormWorker to validate meta data array")
        XCTAssert(formPresentationLogicSpy.validateCalled, "Validate() should ask presenter to format cells result")
    }
    
    func testRestartShouldAskFormWorkerToRestartArrayMetaDataAndPresenterToFormatResult()
    {
        //Given
        let formPresentationLogicSpy = FormPresentationLogicSpy()
        sut.presenter = formPresentationLogicSpy
        let formWorkerSpy = FormWorkerSpy()
        sut.formWorker = formWorkerSpy
        
        // When
        let request = Form.Restart.Request.init()
        sut.restart(request: request)
        
        // Then
        XCTAssert(formWorkerSpy.restartCellsMetaDataCalled, "Restart() should ask FormWorker to restart meta data array")
        XCTAssert(formPresentationLogicSpy.restartCalled, "Restart() should ask presenter to format cells result")
    }
}
