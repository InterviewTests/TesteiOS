//
//  AddContactWorkerTests.swift
//  SantanderTesteiOSTests
//
//  Created by Iterative on 24/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import XCTest
@testable import SantanderTesteiOS

class AddContactWorkerTests: XCTestCase {
    
    var worker : AddContactWorker!
    
    override func setUp() {
        super.setUp()
        self.worker = AddContactWorker()
    }
    
    func testScreenSuccessRequest() {
        
        var cells : [Cell]!
        
        let addContactWorkerExpectation = expectation(description: "Wait for addContact worker fetchCells to return")
        
        self.worker.fetchCells(completion: { response in
            cells = response
            addContactWorkerExpectation.fulfill()
        }, failure: { fail in
            
        })
        
        waitForExpectations(timeout: 2.0)
        
        //Then
        
        XCTAssertNotNil(cells, "AllFunds loaded")
        
        XCTAssert(cells.count > 0, "Did loaded cells")
    }
}
