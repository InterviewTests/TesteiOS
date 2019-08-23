//
//  ContactPresenterTests.swift
//  SantanderUnitTests
//
//  Created by Orlando Amorim on 22/08/19.
//

import XCTest
@testable import Santander

class ContactPresenterTests: XCTestCase {
    
    // MARK: - Interactor
    var presenter: ContactPresenter!
    
    // MARK: - Test lifecycle
    override func setUp() {
        super.setUp()
        setupPresenter()
    }
    
    override func tearDown() {
        presenter = nil
        super.tearDown()
    }
    
    // MARK: - Test setup
    func setupPresenter() {
        presenter = ContactPresenter()
    }
    
    class ContactDisplayLogicSpy: ContactDisplayLogic {
        
        // MARK: Method call expectations
        var displayFormCalled = false
        var displayErrorCalled = false
        var displaySuccessCalled = false

        // MARK: Argument expectations
        var form: ContactForm!
        var error: String!
        
        // MARK: Spied methods
        func displayForm(_ form: ContactForm) {
            displayFormCalled = true
            self.form = form
        }
        
        func displayError(_ error: String) {
            displayErrorCalled = true
            self.error = error
        }
        
        func displaySuccess() {
            displaySuccessCalled = true
        }
    }
    
    // MARK: - Tests
    
    func testPresenterPresentFormShouldAskViewControllerToDisplayForm() {
        // Given
        let contactDisplayLogicSpy = ContactDisplayLogicSpy()
        presenter.viewController = contactDisplayLogicSpy
        
        // When
        let cells = [TestData.ContactForm.emailCell]
        let contactForm = ContactForm(cells: cells)
        presenter.presentForm(contactForm)
        
        // Then
        XCTAssert(contactDisplayLogicSpy.displayFormCalled, "Presenting fetched contact form should ask view controller to display them")
    }
    
    func testPresenterPresentErrorShouldAskViewControllerToDisplayError() {
        // Given
        let contactDisplayLogicSpy = ContactDisplayLogicSpy()
        presenter.viewController = contactDisplayLogicSpy
        
        // When
        let error = TestError.contact
        presenter.presentError(error)
        
        // Then
        XCTAssert(contactDisplayLogicSpy.displayErrorCalled, "Presenting present error should ask view controller to display them")
    }
    
    func testPresenterPresentSuccessShouldAskViewControllerToDisplaySuccess() {
        // Given
        let contactDisplayLogicSpy = ContactDisplayLogicSpy()
        presenter.viewController = contactDisplayLogicSpy
        
        // When
        presenter.presentSuccess()
        
        // Then
        XCTAssert(contactDisplayLogicSpy.displaySuccessCalled, "Presenting present success should ask view controller to display them")
    }
    
    func testPresentPresentErrorShouldFormatErrorForDisplay() {
        // Given
        let contactDisplayLogicSpy = ContactDisplayLogicSpy()
        presenter.viewController = contactDisplayLogicSpy
        
        // When
        let error = TestError.contact
        presenter.presentError(error)
        
        // Then
        XCTAssertEqual(contactDisplayLogicSpy.error, error.localizedDescription, "Presenting should properly format error")
    }
}
