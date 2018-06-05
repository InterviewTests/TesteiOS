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
        
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "testFormDecoder", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
                data = jsonData
            } catch {
                // handle error
            }
        }
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFormEncoder() {
        let formEncoder = FormDecoder(data: data)
        formEncoder.decode()
        print(formEncoder.formObjects)
        XCTAssertTrue(formEncoder.formObjects.count > 0)
    }
    
    
    func testFormObjectCreator() {
        let formEncoder = FormDecoder(data: data)
        formEncoder.decode()
        print(formEncoder.formObjects)
        XCTAssertTrue(formEncoder.initializedFormObjects.count > 0)
    }
    
}
