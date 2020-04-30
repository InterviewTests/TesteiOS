//
//  InvestmentFundsPresenterTests.swift
//  Teste SantanderTests
//
//  Created by Eduardo Alves Sumiya on 30/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import XCTest
@testable import Teste_Santander

class InvestmentFundsPresenterTests: XCTestCase {
    var presenter: InvestmentFundsPresenter!
    var viewController: InvestmentFundsViewController!
    
    override func setUp() {
        viewController = InvestmentFundsViewController.loadFromNib()
        presenter = InvestmentFundsPresenter(viewController: viewController)
        viewController.loadView()
        viewController.viewDidLoad()
    }
    
    func testViewControllerInstance() {
        XCTAssertTrue(presenter.viewController != nil)
    }
    
    func testViewControllerStackinstance() throws {
        do {
            let data = loadStubFromBundle(withName: "funds", extension: "json")
            let investmentModel = try JSONDecoder().decode(Screen.self, from: data)
            
            presenter.handleFunds(funds: InvestmentFundsViewModel(funds: investmentModel.screen))
            
            XCTAssert(viewController.tblFunds.numberOfRows(inSection: 0) > 0)
        } catch {
            XCTAssert(false)
        }
    }
    
    func testErrorHandling() throws {
        let error = NSError(domain: "Generic Error", code: 0, userInfo: nil)
        presenter.handleError(error: error)
    }
    
    func loadStubFromBundle(withName name: String, extension: String) -> Data {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: `extension`)

        return try! Data(contentsOf: url!)
    }
}
