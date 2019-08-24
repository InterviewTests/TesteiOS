//
//  FormViewPresenterTest.swift
//  Tests
//
//  Created by Erika de Almeida Segatto on 20/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import XCTest
import Domain
@testable import TesteiOS

class FormViewPresenterTest: XCTestCase {

    var apiUseCase = ApiUseCaseMock()
    var view = FormViewControllerMock()
    var presenter: FormViewPresenter!
    
    override func setUp() {
        super.setUp()
        presenter = FormViewPresenterImplementation(view: view, apiUseCase: apiUseCase)
    }

    override func tearDown() {
        presenter = nil
        super.tearDown()
    }

    func test_viewDidLoad_getFormFieldsCalled_success() {
        // Given
        apiUseCase.getFormFieldsCalled = false
        apiUseCase.forceError = false
        
        // When
        presenter.viewDidLoad()
        
        // Then
        XCTAssertNil(view.errorShowed)
        XCTAssertTrue(apiUseCase.getFormFieldsCalled, "apiUseCase.getFormFieldsCalled")
    }

    func test_viewDidLoad_getFormFieldsCalled_error() {
        // Given
        apiUseCase.getFormFieldsCalled = false
        apiUseCase.forceError = true
        
        // When
        presenter.viewDidLoad()
        
        // Then
        XCTAssertNotNil(view.errorShowed)
        XCTAssertTrue(apiUseCase.getFormFieldsCalled, "apiUseCase.getFormFieldsCalled")
    }
    
    func test_getRowCount() {
        // Given
        apiUseCase.formCellList = FormCell.newList(count: 20)
        apiUseCase.forceError = false
        
        // When
        presenter.viewDidLoad()
        let num = presenter.getRowCount()
        
        // Then
        XCTAssertNil(view.errorShowed)
        XCTAssertEqual(apiUseCase.formCellList.count, num, "cell count")
    }
    
    func test_getRowType() {
        // Given
        apiUseCase.formCellList = FormCell.newList(count: 35)
        apiUseCase.forceError = false
        
        presenter.viewDidLoad()
        
        for index in -1...apiUseCase.formCellList.count+1 {
            //Given
            let expectedCell = (index>=0 && index<apiUseCase.formCellList.count) ? apiUseCase.formCellList[index] : nil
            
            // When
            let cellType = presenter.getRowType(at: index)
            
            // Then
            XCTAssertNil(view.errorShowed, "at index \(index)")
            XCTAssertEqual(expectedCell?.cellType ?? .text, cellType, "cell type at index \(index)")
        }
    }
    
    func test_configureCell() {
        // Given
        apiUseCase.formCellList = FormCell.newList(count: 35)
        apiUseCase.forceError = false
        
        presenter.viewDidLoad()
        
        for index in -1...apiUseCase.formCellList.count+1 {
            //Given
            let expectedCell = (index>=0 && index<apiUseCase.formCellList.count) ? apiUseCase.formCellList[index] : nil
            
            // When
            let mockCell = FormViewCellMock()
            presenter.configure(cell: mockCell, at: index)
            
            // Then
            XCTAssertNil(view.errorShowed, "at index \(index)")
            XCTAssertEqual(expectedCell?.id, mockCell.id, "cell id at index \(index)")
            XCTAssertEqual(expectedCell?.message, mockCell.message, "cell message at index \(index)")
            XCTAssertEqual(expectedCell?.fieldType, mockCell.fieldType, "cell fieldType at index \(index)")
            XCTAssertNil(mockCell.userInput, "cell userInput at index \(index)")
            XCTAssertEqual(expectedCell?.hidden, mockCell.hidden, "cell hidden at index \(index)")
            XCTAssertEqual(expectedCell?.topSpacing, mockCell.topSpacing, "cell topSpacing at index \(index)")
            XCTAssertTrue(mockCell.enabled ?? true, "mockCell.enabled")
            if expectedCell != nil {
                XCTAssertEqual(true, mockCell.enabled, "cell enabled at index \(index)")
                XCTAssertNotNil(mockCell.delegate, "cell delegate at index \(index)")
            } else {
                XCTAssertNil(mockCell.enabled, "cell enabled at index \(index)")
                XCTAssertNil(mockCell.delegate, "cell delegate at index \(index)")
            }
        }
    }
    
    
    func test_sendButtonCall_updatedCell() {
        // Given
        apiUseCase.formCellList = [
            try! FormCell(id: 17334, cellType: CellType.field.rawValue, fieldType: String(FieldType.email.rawValue), message: "Message2", topSpacing: 2, show: 1, hidden: true, required: false)
        ]
        apiUseCase.forceError = false
        apiUseCase.sendFormCalled = false
        
        // When
        presenter.viewDidLoad()
        let mockCell = FormViewCellMock()
        presenter.configure(cell: mockCell, at: 0)
        
        mockCell.delegate?.saveUserInput("a@b.com", id: 17334)
        mockCell.delegate?.sendButtonPressed()
        presenter.configure(cell: mockCell, at: 0)
        
        // Then
        XCTAssertTrue(apiUseCase.sendFormCalled, "apiUseCase.sendFormCalled")
        XCTAssertFalse(mockCell.enabled ?? true, "mockCell.enabled")
    }
    
    
    func test_clearUserInput() {
        // Given
        apiUseCase.formCellList = [
            try! FormCell(id: 17334, cellType: CellType.field.rawValue, fieldType: String(FieldType.email.rawValue), message: "Message2", topSpacing: 2, show: 1, hidden: true, required: false)
        ]
        let mockCell = FormViewCellMock()
        let userInput = "some user input"
        
        // When
        presenter.viewDidLoad()
        presenter.setRowUserInput(userInput, at: 0)
        presenter.configure(cell: mockCell, at: 0)
        // Then
        XCTAssertEqual(userInput, mockCell.userInput as? String, "expected some user input")
        
        // When
        presenter.clearUserInput()
        presenter.configure(cell: mockCell, at: 0)
        // Then
        XCTAssertEqual(nil, mockCell.userInput as? String, "expected no user input")
    }
    
    
    func test_sendButtonCall_sendForm_success() {
        // Given
        apiUseCase.apiDelay = false
        apiUseCase.formCellList = [
            try! FormCell(id: 17334, cellType: CellType.field.rawValue, fieldType: String(FieldType.email.rawValue), message: "Message2", topSpacing: 2, show: 1, hidden: true, required: false)
        ]
        apiUseCase.forceError = false
        apiUseCase.sendFormCalled = false
        view.isInFormSentPage = false
        
        // When
        presenter.viewDidLoad()
        let mockCell = FormViewCellMock()
        presenter.configure(cell: mockCell, at: 0)
        
        mockCell.delegate?.saveUserInput("a@b.com", id: 17334)
        mockCell.delegate?.sendButtonPressed()
        Thread.sleep(forTimeInterval: 2)
        
        
        // Then
        XCTAssertNotNil(mockCell.delegate, "mockCell.delegate")
        XCTAssertTrue(view.isInFormSentPage, "view.isInFormSentPage")
        XCTAssertNil(view.errorShowed, "view.errorShowed")
        XCTAssertTrue(apiUseCase.sendFormCalled, "apiUseCase.sendFormCalled")
    }
    
    
    func test_sendButtonCall_sendForm_error() {
        // Given
        apiUseCase.formCellList = [
            try! FormCell(id: 17334, cellType: CellType.field.rawValue, fieldType: String(FieldType.email.rawValue), message: "Message2", topSpacing: 2, show: 1, hidden: true, required: false)
        ]
        apiUseCase.forceError = false
        apiUseCase.sendFormCalled = false
        
        // When
        presenter.viewDidLoad()
        let mockCell = FormViewCellMock()
        presenter.configure(cell: mockCell, at: 0)
        
        mockCell.delegate?.saveUserInput("a@b.com", id: 17334)
        apiUseCase.forceError = true
        mockCell.delegate?.sendButtonPressed()
        
        // Then
        XCTAssertNotNil(mockCell.delegate, "mockCell.delegate")
        XCTAssertNotNil(view.errorShowed, "view.errorShowed")
        XCTAssertTrue(apiUseCase.sendFormCalled, "apiUseCase.sendFormCalled")
    }
    
    
    func test_validateForm_invalidInput_email() {
        // Given
        apiUseCase.formCellList = [
            try! FormCell(id: 17334, cellType: CellType.field.rawValue, fieldType: String(FieldType.email.rawValue), message: "Message2", topSpacing: 2, show: 1, hidden: true, required: false)
        ]
        apiUseCase.forceError = false
        apiUseCase.sendFormCalled = false
        
        // When
        presenter.viewDidLoad()
        let mockCell = FormViewCellMock()
        presenter.configure(cell: mockCell, at: 0)
        
        mockCell.delegate?.saveUserInput(".com", id: 17334)
        mockCell.delegate?.sendButtonPressed()
        
        // Then
        XCTAssertNotNil(mockCell.delegate, "mockCell.delegate")
        XCTAssertNotNil(view.errorShowed, "view.errorShowed")
        XCTAssertFalse(apiUseCase.sendFormCalled, "apiUseCase.sendFormCalled")
    }
    
    func test_validateForm_invalidInput_phone() {
        // Given
        apiUseCase.formCellList = [
            try! FormCell(id: 17334, cellType: CellType.field.rawValue, fieldType: String(FieldType.telNumber.rawValue), message: "Message2", topSpacing: 2, show: 1, hidden: true, required: false)
        ]
        apiUseCase.forceError = false
        apiUseCase.sendFormCalled = false
        
        // When
        presenter.viewDidLoad()
        let mockCell = FormViewCellMock()
        presenter.configure(cell: mockCell, at: 0)
        
        mockCell.delegate?.saveUserInput("0", id: 17334)
        mockCell.delegate?.sendButtonPressed()
        
        // Then
        XCTAssertNotNil(mockCell.delegate, "mockCell.delegate")
        XCTAssertNotNil(view.errorShowed, "view.errorShowed")
        XCTAssertFalse(apiUseCase.sendFormCalled, "apiUseCase.sendFormCalled")
    }
    
    func test_validateForm_invalidInput_text() {
        // Given
        apiUseCase.formCellList = [
            try! FormCell(id: 17334, cellType: CellType.field.rawValue, fieldType: String(FieldType.text.rawValue), message: "Message2", topSpacing: 2, show: 1, hidden: true, required: false)
        ]
        apiUseCase.forceError = false
        apiUseCase.sendFormCalled = false
        
        // When
        presenter.viewDidLoad()
        let mockCell = FormViewCellMock()
        presenter.configure(cell: mockCell, at: 0)
        
        mockCell.delegate?.saveUserInput("", id: 17334)
        mockCell.delegate?.sendButtonPressed()
        
        // Then
        XCTAssertNotNil(mockCell.delegate, "mockCell.delegate")
        // As the field is not required, currently all inputs are valid
        XCTAssertNil(view.errorShowed, "view.errorShowed")
        XCTAssertTrue(apiUseCase.sendFormCalled, "apiUseCase.sendFormCalled")
    }
    
    func test_validateForm_invalidInput_nil() {
        // Given
        apiUseCase.formCellList = [
            try! FormCell(id: 17334, cellType: CellType.field.rawValue, fieldType: String(FieldType.text.rawValue), message: "Message2", topSpacing: 2, show: 1, hidden: true, required: false)
        ]
        apiUseCase.forceError = false
        apiUseCase.sendFormCalled = false
        
        // When
        presenter.viewDidLoad()
        let mockCell = FormViewCellMock()
        presenter.configure(cell: mockCell, at: 0)
        mockCell.delegate?.sendButtonPressed()
        
        // Then
        XCTAssertNotNil(mockCell.delegate, "mockCell.delegate")
        XCTAssertNil(view.errorShowed, "view.errorShowed")
        XCTAssertTrue(apiUseCase.sendFormCalled, "apiUseCase.sendFormCalled")
    }
    
    
    func test_validateForm_incompleteForm_notRequired() {
        let cellTypesToCheck = [
            try! FormCell(id: 1, cellType: CellType.field.rawValue, fieldType: String(FieldType.email.rawValue), message: "Message2", topSpacing: 2, show: 1, hidden: true, required: false),
            try! FormCell(id: 2, cellType: CellType.checkbox.rawValue, fieldType: String(FieldType.email.rawValue), message: "Message2", topSpacing: 2, show: 1, hidden: true, required: false)
        ]
        for cell in cellTypesToCheck {
            // Given
            apiUseCase.formCellList = [cell]
            apiUseCase.forceError = false
            apiUseCase.sendFormCalled = false
            
            // When
            presenter.viewDidLoad()
            let mockCell = FormViewCellMock()
            presenter.configure(cell: mockCell, at: 0)
            
            mockCell.delegate?.sendButtonPressed()
            
            // Then
            XCTAssertNotNil(mockCell.delegate, "mockCell.delegate in cell \(cell.id)")
            XCTAssertNil(view.errorShowed, "view.errorShowed in cell \(cell.id)")
            XCTAssertTrue(apiUseCase.sendFormCalled, "apiUseCase.sendFormCalled in cell \(cell.id)")
        }
    }
    
    func test_validateForm_incompleteForm_required() {
        let cellTypesToCheck = [
            try! FormCell(id: 1, cellType: CellType.field.rawValue, fieldType: String(FieldType.email.rawValue), message: "Message1", topSpacing: 2, show: 1, hidden: false, required: true),
            try! FormCell(id: 2, cellType: CellType.checkbox.rawValue, fieldType: "", message: "Message2", topSpacing: 2, show: 1, hidden: false, required: true)
        ]
        for cell in cellTypesToCheck {
            // Given
            apiUseCase.formCellList = [cell]
            apiUseCase.forceError = false
            apiUseCase.sendFormCalled = false
            
            // When
            presenter.viewDidLoad()
            let mockCell = FormViewCellMock()
            presenter.configure(cell: mockCell, at: 0)
            mockCell.delegate?.sendButtonPressed()
            
            // Then
            XCTAssertNotNil(mockCell.delegate, "mockCell.delegate in cell \(cell.id)")
            XCTAssertNotNil(view.errorShowed, "view.errorShowed in cell \(cell.id)")
            XCTAssertFalse(apiUseCase.sendFormCalled, "apiUseCase.sendFormCalled in cell \(cell.id)")
        }
    }
}
