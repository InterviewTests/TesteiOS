//
//  FundViewPresenterTest.swift
//  Tests
//
//  Created by Erika de Almeida Segatto on 26/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import XCTest
import Domain
@testable import TesteiOS

class FundViewPresenterTest: XCTestCase {
    
    var apiUseCase = ApiUseCaseMock()
    var view = FundViewControllerMock()
    var presenter: FundViewPresenter!
    
    override func setUp() {
        super.setUp()
        presenter = FundViewPresenterImplementation(view: view, apiUseCase: apiUseCase)
    }
    
    override func tearDown() {
        presenter = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_getFundFieldsCalled_success() {
        // Given
        apiUseCase.getFundInfoCalled = false
        apiUseCase.forceError = false
        
        // When
        presenter.viewDidLoad()
        
        // Then
        XCTAssertNil(view.errorShowed)
        XCTAssertTrue(apiUseCase.getFundInfoCalled, "getFundInfoCalled")
    }

    func test_viewDidLoad_getFundFieldsCalled_error() {
        // Given
        apiUseCase.getFundInfoCalled = false
        apiUseCase.forceError = true
        
        // When
        presenter.viewDidLoad()
        
        // Then
        XCTAssertNotNil(view.errorShowed)
        XCTAssertTrue(apiUseCase.getFundInfoCalled, "getFundInfoCalled")
    }
    
    
    func test_getRowCount() {
        // Given
        let fund = apiUseCase.fund
        let expectedRowCount = 2 + fund.downInfo.count + fund.info.count
        apiUseCase.forceError = false
        presenter.viewDidLoad()
        
        // When
        let rowCount = presenter.getRowCount()
        
        // Then
        XCTAssertNil(view.errorShowed)
        XCTAssertEqual(expectedRowCount, rowCount, "rowCount")
    }
    
    func test_getRowStartPositionOfFundInfo() {
        // Given
        let expectedRowCount = 1
        apiUseCase.forceError = false
        presenter.viewDidLoad()
        
        // When
        let rowCount = presenter.getRowStartPositionOfFundInfo()
        
        // Then
        XCTAssertNil(view.errorShowed)
        XCTAssertEqual(expectedRowCount, rowCount, "rowCount")
    }
    
    func test_getRowStartPositionOfFundDownInfo() {
        // Given
        let fund = apiUseCase.fund
        let expectedRowCount = 1 + fund.info.count
        apiUseCase.forceError = false
        presenter.viewDidLoad()
        
        // When
        let rowCount = presenter.getRowStartPositionOfFundDownInfo()
        
        // Then
        XCTAssertNil(view.errorShowed)
        XCTAssertEqual(expectedRowCount, rowCount, "rowCount")
    }
    
    
    func test_configure_FundCell() {
        // Given
        let fund = apiUseCase.fund
        apiUseCase.forceError = false
        presenter.viewDidLoad()
        
        // When
        let mockCell = FundViewCellMock()
        presenter.configure(cell: mockCell)
        
        // Then
        XCTAssertNil(view.errorShowed)
        XCTAssertEqual(fund.title, mockCell.title, "title")
        XCTAssertEqual(fund.fundName, mockCell.fundName, "fundName")
        XCTAssertEqual(fund.whatIs, mockCell.whatIs, "whatIs")
        XCTAssertEqual(fund.definition, mockCell.definition, "definition")
        XCTAssertEqual(fund.riskTitle, mockCell.riskTitle, "riskTitle")
        XCTAssertEqual(fund.risk, mockCell.riskIndex, "riskIndex")
        XCTAssertEqual(fund.infoTitle, mockCell.infoTitle, "infoTitle")
        XCTAssertEqual(fund.moreInfo.month.fund.formatAsPercentage(), mockCell.monthInfoFund, "monthInfoFund")
        XCTAssertEqual(fund.moreInfo.month.cdi.formatAsPercentage(), mockCell.monthInfoCdi, "monthInfoCdi")
        XCTAssertEqual(fund.moreInfo.year.fund.formatAsPercentage(), mockCell.yearInfoFund, "yearInfoFund")
        XCTAssertEqual(fund.moreInfo.year.cdi.formatAsPercentage(), mockCell.yearInfoCdi, "yearInfoCdi")
        XCTAssertEqual(fund.moreInfo.twelveMonths.fund.formatAsPercentage(), mockCell.twelveMonthsFund, "twelveMonthsFund")
        XCTAssertEqual(fund.moreInfo.twelveMonths.cdi.formatAsPercentage(), mockCell.twelveMonthsCdi, "twelveMonthsCdi")
    }
    
    func test_configure_ButtonViewCell() {
        // Given
        apiUseCase.forceError = false
        presenter.viewDidLoad()
        
        // When
        let mockCell = FormViewCellMock()
        presenter.configure(cell: mockCell)
        
        // Then
        XCTAssertNil(view.errorShowed)
        XCTAssertEqual("Investir", mockCell.message, "title")
    }
    
    func test_configure_FundInfoCell() {
        // Given
        let fund = apiUseCase.fund
        apiUseCase.forceError = false
        presenter.viewDidLoad()
        
        for i in 0..<fund.info.count {
            // Then
            let info = fund.info[i]
            
            // When
            let mockCell = FundInfoCellMock()
            presenter.configure(cell: mockCell, at: 1 + i)
            
            // Then
            XCTAssertNil(view.errorShowed)
            XCTAssertEqual(info.name, mockCell.title, "title at row \(i)")
            XCTAssertEqual(info.data, mockCell.text, "fundName at row \(i)")
        }
    }
    
    func test_configure_FundDownInfoCell() {
        // Given
        let fund = apiUseCase.fund
        apiUseCase.forceError = false
        presenter.viewDidLoad()
        
        for i in 0..<fund.downInfo.count {
            // Then
            let info = fund.downInfo[i]
            
            // When
            let mockCell = FundDownInfoCellMock()
            presenter.configure(cell: mockCell, at: 1 + fund.info.count + i)
            
            // Then
            XCTAssertNil(view.errorShowed)
            XCTAssertEqual(info.name, mockCell.title, "title at row \(i)")
            XCTAssertEqual(info.data, mockCell.text, "fundName at row \(i)")
        }
    }
    
    
    func test_sendButtonPressed() {
        // Given
        view.isInFundDetailPage = false
        apiUseCase.forceError = false
        presenter.viewDidLoad()
        
        // When
        let mockCell = FormViewCellMock()
        presenter.configure(cell: mockCell)
        mockCell.delegate?.sendButtonPressed()
        
        // Then
        XCTAssertNil(view.errorShowed)
        XCTAssertTrue(view.isInFundDetailPage, "isInFundDetailPage")
    }
    
    
    
    func test_saveUserInput() {
        // Given
        apiUseCase.forceError = false
        presenter.viewDidLoad()
        
        // When
        let mockCell = FormViewCellMock()
        presenter.configure(cell: mockCell)
        mockCell.delegate?.saveUserInput("", id: 0)
        
        // Then
        XCTAssertNil(view.errorShowed)
        
    }
}
