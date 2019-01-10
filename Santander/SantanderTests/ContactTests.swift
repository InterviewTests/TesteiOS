//
//  ContactTests.swift
//  SantanderTests
//
//  Created by Jonathan Martins on 09/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import XCTest
@testable import Santander

class ContactViewMock:NSObject, ContactViewDelegate{
    
    var popupTitle   = ""
    var popupMessage = ""
    var showPageWasCalled        = false
    var hidePageWasCalled        = false
    var updateTableViewWasCalled = false
    
    func displayPopup(title: String, message: String) {
        popupTitle   = title
        popupMessage = message
    }
    
    func updateTableViewItems(items: [FormItem]) {
        updateTableViewWasCalled = true
    }
    
    func showSuccessPage() {
        showPageWasCalled = true
    }
    
    func hideSuccessPage() {
        hidePageWasCalled = true
    }
}

class ContactTests: XCTestCase {

    override func setUp() {
    
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
