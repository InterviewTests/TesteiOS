//
//  ContactFormViewControllerPresenter.swift
//  Teste SantanderTests
//
//  Created by Eduardo Alves Sumiya on 30/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import XCTest
@testable import Teste_Santander

class ContactFormPresenterTests: XCTestCase {
    var presenter: ContactFormPresenter!
    var viewController: ContactFormViewController!
    
    override func setUp() {
        viewController = ContactFormViewController.loadFromNib()
        presenter = ContactFormPresenter(viewController: viewController)
        viewController.loadView()
        viewController.viewDidLoad()
    }
    
    func testViewControllerInstance() {
        XCTAssertTrue(presenter.viewController != nil)
    }
    
    func testViewControllerStackinstance() throws {
        do {
            let data = loadStubFromBundle(withName: "cells", extension: "json")
            let contactModel = try JSONDecoder().decode(ContactModel.self, from: data)
            
            presenter.handleFormCells(cells: contactModel)
            XCTAssert(viewController.stackFormView?.arrangedSubviews != nil)
        } catch {
            XCTAssert(false)
        }
    }
    
    func testErrorHandling() throws {
        let error = NSError(domain: "Generic Error", code: 0, userInfo: nil)
        presenter.handleError(error: error)
    }
    
    func loadStubFromBundle(withName name: String, extension: String) -> Data {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: `extension`)

        return try! Data(contentsOf: url!)
    }
}
