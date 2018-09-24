//
//  AddContactPresenterTests.swift
//  SantanderTesteiOSTests
//
//  Created by Iterative on 24/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import XCTest
@testable import SantanderTesteiOS


class AddContactPresenterTests: XCTestCase {
    var presenter : AddContactPresenter!
    
    override func setUp() {
        super.setUp()
        self.presenter = AddContactPresenter()
    }
    
    
    func testResponseWithViewModel() {
        let worker : AddContactWorker = AddContactWorker()
        var cells : [Cell]!
        
        let addContactWorkerExpectation = expectation(description: "Wait for addContact worker fetchCells to return")
        
        worker.fetchCells(completion: { response in
            cells = response
            addContactWorkerExpectation.fulfill()
        }, failure: { fail in
            
        })
        
        waitForExpectations(timeout: 2.0)
        
        let response = AddContactModels.Cells.Response(cells: cells)
        
        XCTAssertNotNil(response)
        
        XCTAssertEqual(cells, response.cells)
        
        XCTAssertEqual(cells.first, response.cells.first)
    }
}
