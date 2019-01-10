//
//  ProductTests.swift
//  SantanderTests
//
//  Created by Jonathan Martins on 09/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import XCTest
@testable import Santander

/// Mocked ProductView for test
class ProductViewMock:NSObject, ProductViewDelegate{
    
    var urlToOpen    = ""
    var popupTitle   = ""
    var popupMessage = ""
    var updateTableViewWasCalled = false
    
    func updateTableViewItems(){
        updateTableViewWasCalled = true
    }
    
    func openWebView(site:String){
        urlToOpen = site
    }

    func displayPopup(title: String, message: String) {
        popupTitle   = title
        popupMessage = message
    }
}

/// Mocked ProductPresenter for test
class ProductPresenterMock:NSObject, ProductPresenterDelegate{
    
    var productView:ProductViewDelegate?
    var requestInfoWasCalled = false
    var infoForRowWasCalled = false
    var downInfoForRowWasCalled = false
    var profitabilityForRowWasCalled = false
    var downloadWasCalled = false
    var investWasCalled = false
    
    func bindTo(view: ProductViewDelegate) {
        productView = view
    }
    
    func requestInfo() {
        requestInfoWasCalled = true
    }
    
    func infoForRow(_ row: Int) -> Info? {
        infoForRowWasCalled = true
        return nil
    }
    
    func downInfoForRow(_ row: Int) -> Info? {
        downInfoForRowWasCalled = true
        return nil
    }
    
    func profitabilityForRow(_ row: Int) -> Profitability? {
        profitabilityForRowWasCalled = true
        return nil
    }
    
    func download() {
        downloadWasCalled = true
    }
    
    func invest() {
        investWasCalled = true
    }
}

class ProductTests: XCTestCase {
    
    override func setUp() {
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testUpdateTableViewItems(){
        let productView = ProductViewMock()

        productView.updateTableViewItems()
        XCTAssertTrue(productView.updateTableViewWasCalled)
        
    }
    
    func testOpenWebView(){
        let url = "www.google.com"
        let productView = ProductViewMock()

        productView.openWebView(site: url)
        XCTAssertEqual(productView.urlToOpen, url)
    }
    
    func testDisplayPopup(){
        let title   = "title"
        let message = "message"
        let productView = ProductViewMock()
        
        productView.displayPopup(title: title, message: message)
        XCTAssertEqual(productView.popupTitle  , title)
        XCTAssertEqual(productView.popupMessage, message)
    }
    
    func testViewBound(){
        let productView      = ProductViewMock()
        let productPresenter = ProductPresenterMock()
        
        productPresenter.bindTo(view: productView)
        XCTAssertNotNil(productPresenter.productView)
    }
    
    func testNotBound(){
        let productPresenter = ProductPresenterMock()
        XCTAssertNil(productPresenter.productView)
    }
}
