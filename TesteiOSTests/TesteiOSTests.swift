//
//  TesteiOSTests.swift
//  TesteiOSTests
//
//  Created by Eduardo Lombardi on 28/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import XCTest
@testable import TesteiOS

class TesteiOSTests: XCTestCase {

    var data:Data = Data()
    
    override func setUp() {
        super.setUp()
        
        if let path = Bundle.main.path(forResource: "testFormDecoder", ofType: "json")
        {
            let url = URL(fileURLWithPath: path)
            if let jsonData = Data(url)
            {
             data = jsonData
                print (data)
            }
        }

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFormEncoder() {
        
        let formEncoder = FormDecoder(data: data as Data)
        formEncoder.decode()
        print(formEncoder.formObjects)
        XCTAssertTrue(formEncoder.formObjects.count > 0)

    }
    

    
}
