//
//  Teste_iOS_SantanderTests.swift
//  Teste_iOS_SantanderTests
//
//  Created by Fabricio Rodrigues on 17/09/2018.
//  Copyright © 2018 Fabricio Rodrigues. All rights reserved.
//

import XCTest
@testable import Teste_iOS_Santander

class Teste_iOS_SantanderTests: XCTestCase {
    
    var homeViewController: HomeViewController?
    
    override func setUp() {
        super.setUp()
        
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFormRequest() {
        homeViewController?.getForm()
    }
    
    func testInvestRequest() {
        homeViewController?.getInvest()
    }
    
    func testHomeViewController() {
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        homeViewController = viewController as? HomeViewController
        homeViewController?.loadViewIfNeeded()
        XCTAssertNotNil(homeViewController?.tableView)
    }
    

    
    
    
}
