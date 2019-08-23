//
//  ContactInteractorTests.swift
//  SantanderUnitTests
//
//  Created by Orlando Amorim on 21/08/19.
//

import XCTest
@testable import Santander

class ContactInteractorTests: XCTestCase {
    
    // MARK: - Interactor
    var interactor: ContactInteractor!
    
    // MARK: - Test lifecycle
    override func setUp() {
        super.setUp()
        setupIntercator()
    }
    
    override func tearDown() {
        interactor = nil
        super.tearDown()
    }
    
    // MARK: - Test setup
    func setupIntercator() {
        interactor = ContactInteractor()
    }
    
    class ContactPresentationLogicSpy: ContactPresentationLogic {
        
        // MARK: Method call expectations
        var presentFormCalled = false
        var presentErrorCalled = false
        var presentSuccessCalled = false

        // MARK: Spied methods
        func presentForm(_ form: ContactForm) {
            presentFormCalled = true
        }
        
        func presentError(_ error: Error) {
            presentErrorCalled = true
        }
        
        func presentSuccess() {
            presentSuccessCalled = true
        }
    }
    
    class ContactWorkerSpy: ContactWorker {
        
        var shouldReturnSuccess: Bool = true
        
        // MARK: Method call expectations
        var getFormCalled = false
        
        override func getForm(result: @escaping (Result<ContactForm, Error>) -> Void) {
            getFormCalled = true
            if shouldReturnSuccess {
                let cells = [TestData.ContactForm.emailCell]
                let contactForm = ContactForm(cells: cells)
                result(.success(contactForm))
            } else {
                result(.failure(TestError.contact))
            }
        }
    }
    
    func testFetchContactsShouldAskContactsWorkerToGetFormAndPresenterToFormatSuccessResult() {
        // Given
        let contactPresentationLogicSpy = ContactPresentationLogicSpy()
        interactor.presenter = contactPresentationLogicSpy
        let contactWorkerSpy = ContactWorkerSpy(contactStore: ContactAPI())
        interactor.worker = contactWorkerSpy
        
        // When
        interactor.getForm()
        
        // Then
        XCTAssert(contactWorkerSpy.getFormCalled, "ContactInteractor() should ask ContactWorker to fetch form")
        XCTAssert(contactPresentationLogicSpy.presentFormCalled, "ContactInteractor() should ask presenter to present form")
    }
    
    func testFetchContactsShouldAskContactsWorkerToGetFormAndPresenterToFormatErrorResult() {
        // Given
        let contactPresentationLogicSpy = ContactPresentationLogicSpy()
        interactor.presenter = contactPresentationLogicSpy
        let contactWorkerSpy = ContactWorkerSpy(contactStore: ContactAPI())
        contactWorkerSpy.shouldReturnSuccess = false
        interactor.worker = contactWorkerSpy
        
        // When
        interactor.getForm()
        
        // Then
        XCTAssert(contactWorkerSpy.getFormCalled, "ContactInteractor() should ask ContactWorker to fetch form")
        XCTAssert(contactPresentationLogicSpy.presentErrorCalled, "ContactInteractor() should ask presenter to present error")
    }
    
    
    func testSendContactsFormShouldCallPresenterToShowSuccess() {
        // Given
        let contactPresentationLogicSpy = ContactPresentationLogicSpy()
        interactor.presenter = contactPresentationLogicSpy
        let contactWorkerSpy = ContactWorkerSpy(contactStore: ContactAPI())
        interactor.worker = contactWorkerSpy
        
        // When
        let contactFormDataRequest = ContactFormDataRequest(name: "Teste", email: "test@test.com", phone: "(41) 99734-2345")
        let request = Contact.Form.Request(sendFormData: contactFormDataRequest)
        interactor.sendForm(data: request)

        let expectation = XCTestExpectation(description: "The interactor will sendForm and wait 3 seconds to call presenter")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 3)

        // Then
        XCTAssert(contactPresentationLogicSpy.presentSuccessCalled, "ContactInteractor() should ask presenter to show success")
    }
}
