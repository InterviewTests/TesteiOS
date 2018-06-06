//
//  TesteiOSTests.swift
//  TesteiOSTests
//
//  Created by Eduardo Lombardi on 28/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import XCTest
@testable import TesteiOS
@testable import SkyFloatingLabelTextField

class FormDecoderTests: XCTestCase {

    var data:Data = Data()
    var formDecoder:FormDecoder = FormDecoder(data: Data())
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
        formDecoder = FormDecoder(data:data)
        
    }
    
    
    func testFormDecoder() {
        formDecoder.decode()
        print(formDecoder.formObjects)
        XCTAssertTrue(formDecoder.formObjects.count > 0)
    }
    
    
    func testFormObjectCreator() {
        formDecoder.decode()
        XCTAssertTrue(formDecoder.initializedFormObjects.count > 0)
    }
    
    func testValidationEmpty() {
        formDecoder.decode()
        formDecoder.getTextFields()
        XCTAssertTrue(formDecoder.validation.count > 0)
    }
    
    func testValidation() {
        formDecoder.decode()
        let validator = formDecoder.checkFormValidation()
        XCTAssertTrue(validator == false)
    }
    
}
