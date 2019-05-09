//
//  FormTestCase.swift
//  TesteiOSTests
//
//  Created by anderson.jesus.silva on 09/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import XCTest

class FormTestCase: XCTestCase {
    
    var provider:FormProvider!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        provider = FormProvider()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testRequestSuccess() {
        
        let teste = expectation(description: "Inicio do teste")
        
        self.provider.getCellForm { (cells, error) in
            guard error == nil else {
                print("error")
                return
            }
            
            guard cells != nil else {
                return
            }
            
            if let cells = cells, let listCells = cells.cellsList {
                XCTAssertNotEqual(listCells.count, 0)
                teste.fulfill()
            }
        }
        waitForExpectations(timeout: 40.0)
        
    }
    
    func testRequestFailed() {
        
        let teste = expectation(description: "Inicio do teste")
        
        self.provider.getCellForm { (cells, error) in
            XCTAssertNotNil(error)
            teste.fulfill()
        }
        waitForExpectations(timeout: 40.0)
    }
    
}
