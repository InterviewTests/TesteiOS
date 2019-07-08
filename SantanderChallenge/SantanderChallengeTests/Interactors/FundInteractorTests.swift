//
// FundInteractor.swift
// SantanderChallengeTests
//
// Created for SantanderChallenge on 08/07/19.
//

@testable import SantanderChallenge
import XCTest

class FundInteractorTests: XCTestCase {

    var interactor: FundsInteractor!
    var view: FakeView!
    
    override func setUp() {
        view = FakeView()
        let presenter = FundsPresenter(view: view)
        interactor = FundsInteractor(presenter: presenter)
    }
    
    func testFetchFundsCells() {
        // Arrange
        let expectation = XCTestExpectation(description: "Fetch funds cells")
        
        view.displayFundsCallback = { data in
            // Assert
            XCTAssertNotNil(data)
            expectation.fulfill()
        }
        
        // Act
        interactor.fetchFunds()
        
        wait(for: [expectation], timeout: 2)
    }
    
    class FakeView: FundsPresentableProtocol {
        var displayFundsCallback: (([FundContentData]) -> Void)?
        
        func displayFunds(_ cells: [FundContentData]) {
            displayFundsCallback?(cells)
        }
        
        func displayError(_ error: String) { }
    }
}
