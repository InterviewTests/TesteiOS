//
//  CustomTabBarTests.swift
//  Teste SantanderTests
//
//  Created by Eduardo Alves Sumiya on 30/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import XCTest
@testable import Teste_Santander

class CustomTabBarTests: XCTestCase {

    var tabBar: CustomTabBar!
    
    override func setUp() {
        tabBar = CustomTabBar(frame: .zero)
        tabBar.setup(tabBarItems: ["Item 1", "Item 2"])
        tabBar.setSelectedTab(index: 0)
    }
    
    func testTabBarDesign() throws {
        XCTAssert((tabBar.stackTab.arrangedSubviews[0] as! UIButton).backgroundColor == ColorUtils.buttonTabSelectedRed)
    }
    
    func testTabBarItemText() throws {
        XCTAssert((tabBar.stackTab.arrangedSubviews[0] as! UIButton).title(for: .normal) == "Item 1")
    }
    
    func testTabBarPopulation() throws {
        XCTAssert(tabBar.stackTab.arrangedSubviews.count == 2)
    }
}
