//
//  ContactFormResultViewControllerTests.swift
//  Teste SantanderTests
//
//  Created by Eduardo Alves Sumiya on 30/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import XCTest
@testable import Teste_Santander

class ContactFormResultViewControllerTests: XCTestCase {
    var viewController: ContactFormResultViewController!
    
    override func setUp() {
        viewController = ContactFormResultViewController.loadFromNib()
        viewController.loadView()
        viewController.viewDidLoad()
    }
    
    func testInstance() throws {
        XCTAssertTrue(viewController.isKind(of: ContactFormResultViewController.self))
    }
    
    func testAction() throws {
        viewController.sendNewMessage(viewController.btnSendNewMessage!)
        XCTAssert(viewController.btnSendNewMessage != nil)
    }
}
