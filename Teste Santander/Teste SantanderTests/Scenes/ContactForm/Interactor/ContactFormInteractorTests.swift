//
//  ContactFormInteractorTests.swift
//  Teste SantanderTests
//
//  Created by Eduardo Alves Sumiya on 30/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import XCTest
@testable import Teste_Santander

class ContactFormInteractorTests: XCTestCase {
    var interactor: ContactFormInteractor!
    var presenter: ContactFormPresenter!
    var viewController: ContactFormViewController!
    
    override func setUp() {
        viewController = ContactFormViewController.loadFromNib()
        presenter = ContactFormPresenter(viewController: viewController)
        interactor = ContactFormInteractor(viewController: viewController, presenter: presenter)
    }

    func testFechContactList() throws {
        interactor.fetchContactList()
        
        XCTAssert(interactor.contactFormWorker != nil)
    }
}
