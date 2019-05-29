//
//  SantanderIOSTests.swift
//  SantanderIOSTests
//
//  Created by Adauto Oliveira on 29/05/19.
//  Copyright © 2019 Adauto Oliveira. All rights reserved.
//

import XCTest


class SantanderIOSTests: XCTestCase {

    override func setUp() {
        testValidarTextField()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testValidarTextField() {
        
        var allOk = true
        
        let tfName = UITextField()
        let tfEmail = UITextField()
        let tfPhone = UITextField()
        
        
        tfName.text = "Adauto"
        tfEmail.text = "adauto.oliveira@me.com"
        tfPhone.text = "11-99227-8799"
        
        
        let textFields: [UITextField] = [tfName, tfEmail, tfPhone]
       
        for tfs in textFields {
            
            if tfs.text == "" {
                allOk = false
            }
            
        }
        
        XCTAssertEqual(allOk, true)
        
    }
    
    
    
  

}
