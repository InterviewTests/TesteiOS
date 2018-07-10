//
//  FundsPresenterTests.swift
//  TesteiOSTests
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import XCTest
@testable import TesteiOS

class FundsPresenterTests: XCTestCase {
    // MARK: - Subject under test
    
    var sut: FundsPresenter!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupFundsPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupFundsPresenter() {
        sut = FundsPresenter()
    }
    
    // MARK: - Test doubles
    
    class FundsDisplayLogicSpy: FundsDisplayLogic {
        // MARK: Method call expectations
        
        var displayFetchedFundsCalled = false
        
        // MARK: Argument expectations
        
        var viewModel: Funds.FetchFunds.ViewModel!
        
        // MARK: Spied methods
        
        func displayFetchedFunds(viewModel: Funds.FetchFunds.ViewModel) {
            displayFetchedFundsCalled = true
            self.viewModel = viewModel
        }
    }
    
    // MARK: - Tests
    
    func testPresentFetchedFundsShouldFormatFetchedFundsForDisplay() {
        // Given
        let listFundsDisplayLogicSpy = FundsDisplayLogicSpy()
        sut.viewController = listFundsDisplayLogicSpy
        
        // When
        var text = Seeds.Funds.fund
        text.definition = "Um texto descritivo para um fundo de investimento"
        let funds = [text]
        
        let response = Funds.FetchFunds.Response(funds: funds)
        sut.presentFetchedFunds(response: response)
        
        // Then
        let displayedFunds = listFundsDisplayLogicSpy.viewModel.displayedFunds
        for displayedFund in displayedFunds {
            XCTAssertEqual(displayedFund.title, "Fundos de investimento", "Presenting fetched funds should properly format fund title")
            XCTAssertEqual(displayedFund.definition, "Um texto descritivo para um fundo de investimento", "Presenting fetched funds should properly format fund definition")
        }
    }
    
    func testPresentFetchedFundsShouldAskViewControllerToDisplayFetchedFunds() {
        // Given
        let listFundsDisplayLogicSpy = FundsDisplayLogicSpy()
        sut.viewController = listFundsDisplayLogicSpy
        
        // When
        let funds = [Seeds.Funds.fund]
        let response = Funds.FetchFunds.Response(funds: funds)
        sut.presentFetchedFunds(response: response)
        
        // Then
        XCTAssert(listFundsDisplayLogicSpy.displayFetchedFundsCalled, "Presenting fetched funds should ask view controller to display them")
    }
}
