//
//  InvestmentFundsInteractor.swift
//  Teste SantanderTests
//
//  Created by Eduardo Alves Sumiya on 30/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import XCTest
@testable import Teste_Santander

class InvestmentFundsInteractorTests: XCTestCase {

    var interactor: InvestmentFundsInteractor!
    var presenter: InvestmentFundsPresenter!
    var viewController: InvestmentFundsViewController!

    override func setUp() {
        viewController = InvestmentFundsViewController.loadFromNib()
        presenter = InvestmentFundsPresenter(viewController: viewController)
        interactor = InvestmentFundsInteractor(viewController: viewController, presenter: presenter)
    }

    func testFechFunds() throws {
        interactor.fetchFunds()
        
        XCTAssert(interactor.investmentFundsWorker != nil)
    }
}
