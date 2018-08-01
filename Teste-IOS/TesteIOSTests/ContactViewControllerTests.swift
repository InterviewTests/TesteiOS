//
//  ContactViewControllerTests.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 29/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//


@testable import TesteIOS
import XCTest

class ContactViewControllerTests: XCTestCase {
    // MARK: Subject under test
  
    var sut: ContactViewController!
    var window: UIWindow!
  
    // MARK: Test lifecycle
  
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupContactViewController()
    }
  
    override func tearDown() {
        window = nil
        super.tearDown()
    }
  
    // MARK: Test setup
  
    func setupContactViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "FormViewController") as! ContactViewController
    }
  
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
  
    // MARK: Test doubles
  
    class ContactBusinessLogicSpy: ContactBusinessLogic {
        var fetchCalled = false
        
        func fetch(request: Contact.Fetch.Request) {
            fetchCalled = true
        }
    }
  
    // MARK: Tests
  
    func testShouldDoSomethingWhenViewIsLoaded() {
        // Given
        let spy = ContactBusinessLogicSpy()
        sut.interactor = spy
    
        // When
        loadView()
    
        // Then
        XCTAssertTrue(spy.fetchCalled, "viewDidLoad() should ask the interactor to do something")
  }
  
    func test_display_success() {
        // Given
        let viewModel = Contact.Fetch.ViewModel()
    
        // When
        loadView()
        sut.display(viewModel: viewModel)
    
        // Then
        XCTAssertNotNil(sut.cells)
    }
    
    func test_tableview_rows_is_not_zero() {
        let cell = Cell()
        sut.cells = [cell]
        
        let rows = sut.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(rows, 1)
    }
    
    func test_tableview_rows_is_zero() {
        sut.cells = []
        let rows = sut.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(rows, 0)
    }
}
