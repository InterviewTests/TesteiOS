//
//  ContactFormViewControllerTests.swift
//  Teste SantanderTests
//
//  Created by Eduardo Alves Sumiya on 30/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import XCTest
@testable import Teste_Santander

class ContactFormViewControllerTests: XCTestCase {
    var viewController: ContactFormViewController!
    
    override func setUp() {
        viewController = ContactFormViewController.loadFromNib()
        viewController?.viewDidLoad()
    }
    
    // MARK: - Instance Test
    func testInstance() throws {
        XCTAssertTrue(((viewController?.isKind(of: ContactFormViewController.self)) != nil))
    }
    
    // MARK: - Stack Configuration
    func testStackConfiguration() throws {
        XCTAssertTrue(viewController?.stackFormView != nil)
    }
    
    // MARK: - Stack Components
    func testMessageConfiguration() throws {
        let cell = CellForm(id: 1, type: 2, message: "Message", typefield: .integer(0), hidden: false, topSpacing: 0, show: nil, cellRequired: true)
        viewController?.configureMessage(cell: cell)
        
        var cellConfiguration = false
        
        if let subviews = viewController.stackFormView?.arrangedSubviews {
            for field in subviews {
                if field is UILabel {
                    cellConfiguration = true
                }
            }
        }
        
        XCTAssertTrue(cellConfiguration)
    }
    
    func testTextFieldConfiguration() throws {
        let cell = CellForm(id: 1, type: 1, message: "Message", typefield: .integer(1), hidden: false, topSpacing: 0, show: nil, cellRequired: true)
        viewController?.configureTextField(cell: cell)
        
        var cellConfiguration = false
        
        if let subviews = viewController.stackFormView?.arrangedSubviews {
            for field in subviews {
                if field is CustomTextField {
                    cellConfiguration = true
                }
            }
        }
        
        XCTAssertTrue(cellConfiguration)
    }
    
    func testCheckBoxConfiguration() throws {
        let cell = CellForm(id: 3, type: 4, message: "Message", typefield: .integer(0), hidden: false, topSpacing: 0, show: nil, cellRequired: true)
        viewController?.configureCheckBox(cell: cell)
        
        var cellConfiguration = false
        
        if let subviews = viewController.stackFormView?.arrangedSubviews {
            for field in subviews {
                if field is CustomCheckBox {
                    cellConfiguration = true
                }
            }
        }
        
        XCTAssertTrue(cellConfiguration)
    }
    
    func testButtonConfiguration() throws {
        let cell = CellForm(id: 7, type: 5, message: "Message", typefield: .integer(0), hidden: false, topSpacing: 0, show: nil, cellRequired: true)
        viewController?.configureButton(cell: cell)
        
        var cellConfiguration = false
        
        if let subviews = viewController.stackFormView?.arrangedSubviews {
            for field in subviews {
                if field is RedRoundedButton {
                    cellConfiguration = true
                }
            }
        }
        
        XCTAssertTrue(cellConfiguration)
    }
}
