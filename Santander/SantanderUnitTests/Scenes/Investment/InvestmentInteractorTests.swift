//
//  InvestmentInteractorTests.swift
//  SantanderUnitTests
//
//  Created by Orlando Amorim on 23/08/19.
//

import XCTest
@testable import Santander

class InvestmentInteractorTests: XCTestCase {
    
    // MARK: - Interactor
    var interactor: InvestmentInteractor!
    
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
        interactor = InvestmentInteractor()
    }
    
    class InvestmentPresentationLogicSpy: InvestmentPresentationLogic {

        // MARK: Method call expectations
        var presentScreenCalled = false
        var presentErrorCalled = false
        
        // MARK: Spied methods
        func presentScreen(response: Investment.Funds.Response) {
            presentScreenCalled = true
        }
        
        func presentError(_ error: Error) {
            presentErrorCalled = true
        }
    }
    
    class InvestmentWorkerSpy: InvestmentWorker {
        
        var shouldReturnSuccess: Bool = true
        
        // MARK: Method call expectations
        var getFundsCalled = false
        
        override func getFunds(result: @escaping (Result<Investment.Funds.Response, Error>) -> Void) {
            getFundsCalled = true
            if shouldReturnSuccess {
                let screen = TestData.Investment.screen
                let response = Investment.Funds.Response(screen: screen)
                result(.success(response))
            } else {
                result(.failure(TestError.investment))
            }
        }
    }
    
    func testFetchContactsShouldAskContactsWorkerToGetFormAndPresenterToFormatSuccessResult() {
        // Given
        let investmentPresentationLogicSpy = InvestmentPresentationLogicSpy()
        interactor.presenter = investmentPresentationLogicSpy
        let investmentWorkerSpy = InvestmentWorkerSpy(investmentStore: InvestmentAPI())
        interactor.worker = investmentWorkerSpy
        
        // When
        interactor.getFunds()
        
        // Then
        XCTAssert(investmentWorkerSpy.getFundsCalled, "InvestmentInteractor() should ask InvestmentWorker to fetch funds")
        XCTAssert(investmentPresentationLogicSpy.presentScreenCalled, "InvestmentInteractor() should ask presenter to present screen")
    }
    
    func testFetchContactsShouldAskContactsWorkerToGetFormAndPresenterToFormatErrorResult() {
        // Given
        let investmentPresentationLogicSpy = InvestmentPresentationLogicSpy()
        interactor.presenter = investmentPresentationLogicSpy
        let investmentWorkerSpy = InvestmentWorkerSpy(investmentStore: InvestmentAPI())
        investmentWorkerSpy.shouldReturnSuccess = false
        interactor.worker = investmentWorkerSpy
        
        // When
        interactor.getFunds()
        
        // Then
        XCTAssert(investmentWorkerSpy.getFundsCalled, "InvestmentInteractor() should ask InvestmentWorker to fetch funds")
        XCTAssert(investmentPresentationLogicSpy.presentErrorCalled, "InvestmentInteractor() should ask presenter to present error")
    }
}
