//
//  FormFactoryTest.swift
//  TesteIOSTests
//
//  Created by Sidney Silva on 18/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import XCTest
@testable import TesteIOS

class FormFactoryTest: XCTestCase {
    var cell: Cell!
    var tableView: UITableView!
    var indexPath: IndexPath!
    var contactView: ContactViewController!
    
    override func setUp() {
        super.setUp()
        cell = Cell()
        tableView = UITableView()
        tableView.numberOfRows(inSection: 2)
        FormFactory.registerCell(tableView: tableView)
        indexPath = IndexPath(item: 1, section: 0)
        self.setupContactViewController()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func setupContactViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        contactView = storyboard.instantiateViewController(withIdentifier: "FormViewController") as! ContactViewController
    }

    func test_field_type_tableview_cell() {
        cell.type = FormType.field
        cell.typefield = TypeField.text
        
        let tableViewCell = FormFactory.configureTableViewCell(tableView: tableView, indexPath: indexPath, cell: cell, delegate: contactView)
        XCTAssertNotNil(tableViewCell)
    }
    
    func test_text_type_tableview_cell() {
        cell.type = FormType.text
        cell.typefield = TypeField.text
        
        let tableViewCell = FormFactory.configureTableViewCell(tableView: tableView, indexPath: indexPath, cell: cell, delegate: contactView)
        XCTAssertNotNil(tableViewCell)
    }
    
    func test_send_type_tableview_cell() {
        cell.type = FormType.send
        cell.typefield = TypeField.text
        
        let tableViewCell = FormFactory.configureTableViewCell(tableView: tableView, indexPath: indexPath, cell: cell, delegate: contactView)
        XCTAssertNotNil(tableViewCell)
    }
    
    func test_checkbox_type_tableview_cell() {
        cell.type = FormType.checkbox
        cell.typefield = TypeField.text
        
        let tableViewCell = FormFactory.configureTableViewCell(tableView: tableView, indexPath: indexPath, cell: cell, delegate: contactView)
        XCTAssertNotNil(tableViewCell)
    }
    
    func test_image_type_tableview_cell() {
        cell.type = FormType.image
        cell.typefield = TypeField.text
        
        let tableViewCell = FormFactory.configureTableViewCell(tableView: tableView, indexPath: indexPath, cell: cell, delegate: contactView)
        XCTAssertNotNil(tableViewCell)
    }
}
