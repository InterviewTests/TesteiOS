//
//  InvestmentPresenterTests.swift
//  SantanderUnitTests
//
//  Created by Orlando Amorim on 23/08/19.
//

import XCTest
@testable import Santander

class InvestmentPresenterTests: XCTestCase {
    
    // MARK: - Interactor
    var presenter: InvestmentPresenter!
    
    // MARK: - Test lifecycle
    override func setUp() {
        super.setUp()
        setupPresenter()
    }
    
    override func tearDown() {
        presenter = nil
        super.tearDown()
    }
    
    // MARK: - Test setup
    func setupPresenter() {
        presenter = InvestmentPresenter()
    }
    
    class InvestmentDisplayLogicSpy: InvestmentDisplayLogic {

        // MARK: Method call expectations
        var displayScreenCalled = false
        var displayErrorCalled = false
        
        // MARK: Argument expectations
        var viewModel: Investment.Funds.ViewModel!
        var error: String!
        
        // MARK: Spied methods
        func displayScreen(viewModel: Investment.Funds.ViewModel) {
            displayScreenCalled = true
            self.viewModel = viewModel
        }
        
        func displayError(_ error: String) {
            displayErrorCalled = true
            self.error = error
        }
    }
    
    // MARK: - Tests
    
    func testPresenterPresentFormShouldAskViewControllerToDisplayForm() {
        // Given
        let investmentDisplayLogicSpy = InvestmentDisplayLogicSpy()
        presenter.viewController = investmentDisplayLogicSpy
        
        // When
        let screen = TestData.Investment.screen
        let response = Investment.Funds.Response(screen: screen)
        presenter.presentScreen(response: response)
        
        // Then
        XCTAssert(investmentDisplayLogicSpy.displayScreenCalled, "Presenting fetched screen should ask view controller to display them")
    }
    
    func testPresenterPresentErrorShouldAskViewControllerToDisplayError() {
        // Given
        let investmentDisplayLogicSpy = InvestmentDisplayLogicSpy()
        presenter.viewController = investmentDisplayLogicSpy
        
        // When
        presenter.presentError(TestError.investment)
        
        // Then
        XCTAssert(investmentDisplayLogicSpy.displayErrorCalled, "Presenting present error should ask view controller to display them")
    }
    
    func testPresentPresentErrorShouldFormatErrorForDisplay() {
        // Given
        let investmentDisplayLogicSpy = InvestmentDisplayLogicSpy()
        presenter.viewController = investmentDisplayLogicSpy
        
        // When
        let error = TestError.investment
        presenter.presentError(error)
        
        // Then
        XCTAssertEqual(investmentDisplayLogicSpy.error, error.localizedDescription, "Presenting should properly format error")
    }
}
