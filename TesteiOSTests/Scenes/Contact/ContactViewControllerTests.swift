//
//  ContactViewControllerTests.swift
//  TesteiOSTests
//
//  Created by Dafle Cardoso on 04/08/2018.
//  Copyright © 2018 Dafle Cardoso. All rights reserved.
//

import XCTest
@testable import TesteiOS

class ContactViewControllerTests: XCTestCase {
    
    var session:URLSession!
    
    override func setUp() {
        super.setUp()
        session = URLSession(configuration: .default)
    }
    
    override func tearDown() {
        session = nil
        super.tearDown()
    }
    
    func testRequestAPICells() {
        
        let url = URL(string: "https://floating-mountain-50292.herokuapp.com/cells.json")
        
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        session.dataTask(with: url!) { (data, response, error) in
            
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
            
            
            guard let data = data else {
                
                XCTFail("Dados invalidos")
                return
            }
            
            do {
                let obj = try JSONDecoder().decode(CellResponse.self, from: data)
                
               XCTAssertEqual(obj.cells.count, 6)
                
            } catch {
                XCTFail("JSON INVALIDO")
            }
        
        }.resume()
        
        waitForExpectations(timeout: 30, handler: nil)
        
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
}
