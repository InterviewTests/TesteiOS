//
//  FundsPresenterTests.swift
//  TesteIOS
//
//  Created by Sidney Silva on 18/06/2018.
//  Copyright (c) 2018 Sakura Soft. All rights reserved.
//

@testable import TesteIOS
import XCTest

class FundsPresenterTests: XCTestCase {
    // MARK: Subject under test
  
    var sut: FundsPresenter!
    var funds: Funds!
    // MARK: Test lifecycle
  
    override func setUp() {
        super.setUp()
        setupFundsPresenter()
    }
  
    override func tearDown() {
        super.tearDown()
    }
  
    // MARK: Test setup
  
    func setupFundsPresenter() {
        funds = Funds(title: "teste", fundName: "teste", whatIs: "teste", definition: "teste", riskTitle: "teste", risk: 0, infoTitle: "teste", moreInfo: MoreInfo(month: MoreInfoContent(fund: 0.0, CDI: 0.0), year: MoreInfoContent(fund: 0.0, CDI: 0.0), lastYear: MoreInfoContent(fund: 0.0, CDI: 0.0)), info: [DataInfo(name: "teste", data: "teste")], downInfo: [DataInfo(name: "teste", data: "teste")])
        sut = FundsPresenter()
    }
  
    // MARK: Test doubles
  
    class FundsDisplayLogicSpy: FundsDisplayLogic {
        var displayCalled = false
        
        func display(viewModel: FundsModel.Fetch.ViewModel) {
            displayCalled = true
        }
  }
  
    // MARK: Tests
  
    func test_present() {
        // Given
        let spy = FundsDisplayLogicSpy()
        sut.viewController = spy
        let response = FundsModel.Fetch.Response(screen: funds, error: nil, message: "")
    
        // When
        sut.display(response: response)
    
        // Then
        XCTAssertTrue(spy.displayCalled, "presentSomething(response:) should ask the view controller to display the result")
    }
}
