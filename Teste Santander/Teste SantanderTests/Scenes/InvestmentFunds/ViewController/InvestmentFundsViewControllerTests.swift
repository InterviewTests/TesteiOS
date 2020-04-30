//
//  InvestmentFundsViewControllerTests.swift
//  Teste SantanderTests
//
//  Created by Eduardo Alves Sumiya on 30/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import XCTest
@testable import Teste_Santander

class InvestmentFundsViewControllerTests: XCTestCase {
    var viewController: InvestmentFundsViewController!
    
    override func setUp() {
        viewController = InvestmentFundsViewController.loadFromNib()
        viewController.loadView()
        viewController.viewDidLoad()
    }
    
    func testInstance() throws {
        XCTAssertTrue(viewController.isKind(of: InvestmentFundsViewController.self))
    }
    
    func testTableHeader() throws {
        viewController.setupHeader(title: "Title", fundName: "Fund Name", whatIs: "What Is", definition: "Definition", riskTitle: "Risk Title", investmentValue: 0)
        
        XCTAssertTrue(viewController.tblFunds.tableHeaderView != nil)
    }
    
    func testTableFooter() throws {
        viewController.setupFooter()
        
        XCTAssertTrue(viewController.tblFunds.tableFooterView != nil)
    }
}
