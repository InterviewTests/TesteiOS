//
//  ScreenWorkerTests.swift
//  FinFormTests
//
//  Created by Gustavo on 20/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

@testable import FinForm
import XCTest

class ScreenWorkerTests: XCTestCase
{
    // MARK: - Subject under test
    
    var sut: ScreenWorker!
    static var testScreen: Screen!
    
    // MARK: - Lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupScreenWorker()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    //MARK: - Setup
    
    func setupScreenWorker()
    {
        sut = ScreenWorker.init(screenEngine: ScreenRequesterSpy())
        
        ScreenWorkerTests.testScreen = Seeds.Screens.first
    }
    
    class ScreenRequesterSpy: ScreenRequester
    {
        
        var fetchScreenCalled:Bool = false
        
        override func fetchScreen(completionHandler: @escaping FetchScreenCompletionHandler) {
            fetchScreenCalled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                completionHandler(ScreenWorkerResult.Success(result: ScreenWorkerTests.testScreen))
            }
        }
        
    }
    
    //MARK: - Screen Requester Spy Tests
    
    func testFetchScreenShouldReturnScreen(){
        // Given
        let screenRequesterSpy = sut.screenEngine as! ScreenRequesterSpy
        
        // When
        var fetchedScreen:Screen? = nil
        let expect = expectation(description: "Wait for fetchScreen() to return")
        
        sut.fetchScreen { (result) in
            switch result{
            case .Success(result: let screen):
                fetchedScreen = screen
                break
            case .Failure(error: _):
                break
            }
            expect.fulfill()
        }
        waitForExpectations(timeout: 2.0)
        
        // Then
        XCTAssert(screenRequesterSpy.fetchScreenCalled, "Calling fetchScreen() should ask the data store for a screen")
        XCTAssertNotNil(fetchedScreen, "fetchScreen() should return a screen")
    }
}
