//
//  InvestmentPresenter.swift
//  SantanderTesteiOSTests
//
//  Created by Diego Costa on 24/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import XCTest
@testable import SantanderTesteiOS


class InvestmentPresenter: XCTestCase {
    
    var presenter : InvestmentPresenter?
    
    var viewController : InvestmentViewController?
    
    override func setUp() {
        super.setUp()
        self.viewController = InvestmentViewController()
        self.presenter = InvestmentPresenter()
    }
    
    
    func testPresenterLoaded() {
        XCTAssertNotNil(presenter, "Presenter loaded success")
    }

    func testViewModelFromPresenter() {
    
    }
}
