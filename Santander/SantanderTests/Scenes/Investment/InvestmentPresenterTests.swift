//
//  InvestmentPresenterTests.swift
//  Santander
//
//  Created by Gabriel vieira on 4/23/18.
//  Copyright (c) 2018 Gabriel vieira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Santander
import XCTest

class InvestmentPresenterTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: InvestmentPresenter!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupInvestmentPresenter()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupInvestmentPresenter()
  {
    sut = InvestmentPresenter()
  }
  
  // MARK: Test doubles
  
  class InvestmentDisplayLogicSpy: InvestmentDisplayLogic
  {
    var displayFundDetailCalled = false
    
    func displayFundDetail(viewModel: Investment.FetchFund.ViewModel) {
        displayFundDetailCalled = true
    }
  }
  
  // MARK: Tests
  
  func testPresentSomething()
  {
    // Given
    let spy = InvestmentDisplayLogicSpy()
    sut.viewController = spy
    let fund = Seed.fundsData()
    let response = Investment.FetchFund.Response(fund: fund)
    
    // When
    sut.presentFundDetail(response: response)
    
    // Then
    XCTAssertTrue(spy.displayFundDetailCalled, "presentSomething(response:) should ask the view controller to display the result")
  }
}
