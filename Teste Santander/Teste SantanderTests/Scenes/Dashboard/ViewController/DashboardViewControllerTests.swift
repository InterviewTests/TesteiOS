//
//  DashboardViewController.swift
//  Teste SantanderTests
//
//  Created by Eduardo Alves Sumiya on 30/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import XCTest
@testable import Teste_Santander

class DashboardViewControllerTests: XCTestCase {
    var viewController: DashboardViewController!
    
    override func setUp() {
        viewController = DashboardViewController.loadFromNib()
        viewController.loadView()
        viewController.viewDidLoad()
    }
    
    func testInstance() throws {
        XCTAssertTrue(viewController.isKind(of: DashboardViewController.self))
    }
    
    func testTabBarinstance() throws {
        XCTAssertTrue(viewController.customTabBar != nil)
    }
    
    func testTabBarConfiguration() throws {
        XCTAssertTrue(viewController.customTabBar.stackTab.arrangedSubviews.count == 2)
    }
    
    func testTabSelection() throws {
        viewController.customTabBar.setSelectedTab(index: 1)
        XCTAssertTrue(viewController.customTabBar.selectedTab == 1)
    }
}
