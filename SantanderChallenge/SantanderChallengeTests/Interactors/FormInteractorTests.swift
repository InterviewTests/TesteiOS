//
// FormInteractorTests.swift
// SantanderChallengeTests
//
// Created for SantanderChallenge on 08/07/19.
//

@testable import SantanderChallenge
import XCTest

class FormInteractorTests: XCTestCase {

    var interactor: FormInteractor!
    var view: FakeView!
    
    override func setUp() {
        view = FakeView()
        let presenter = FormPresenter(view: view)
        interactor = FormInteractor(presenter: presenter)
    }
    
    func testFetchFormData() {
        
        // Arrange
        let expectation = XCTestExpectation(description: "Fetch form cells")
        
        view.displayFormCallback = { cells in
            
            // Assert
            XCTAssertNotNil(cells)
            expectation.fulfill()
        }
        
        // Act
        interactor.fetchForm()
        
        wait(for: [expectation], timeout: 2)
    }
    
    func testValidatorsSuccess() {
        
        // Arrange
        let nameStatus = interactor.isValid(name: "Joaquim")
        let phoneStatus = interactor.isValid(phone: "(01) 1234-5678")
        let longPhoneStatus = interactor.isValid(phone: "(01) 12345-6789")
        let emailStatus = interactor.isValid(email: "jared@mail.com")
        
        // Act & Assert
        XCTAssertTrue(nameStatus)
        XCTAssertTrue(phoneStatus)
        XCTAssertTrue(longPhoneStatus)
        XCTAssertTrue(emailStatus)
    }
    
    func testValidatorsFailure() {
        
        // Arrange
        let nameStatus = interactor.isValid(name: "")
        let phoneStatus = interactor.isValid(phone: "(01) 1234-78")
        let longPhoneStatus = interactor.isValid(phone: "(01) 12345-6724389")
        let emailStatus = interactor.isValid(email: "@not_valid@mail@")
        
        // Act & Assert
        XCTAssertFalse(nameStatus)
        XCTAssertFalse(phoneStatus)
        XCTAssertFalse(longPhoneStatus)
        XCTAssertFalse(emailStatus)
    }
    
    class FakeView: FormPresentableProtocol {
        
        var displayFormCallback: (([FormCell]) -> Void)?
        
        func displayForm(_ cells: [FormCell]) {
            displayFormCallback?(cells)
        }
        
        func displayError(_ error: String) {}
    }
}
