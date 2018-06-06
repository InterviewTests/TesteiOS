//
//  InvestDecoderTests.swift
//  TesteiOSTests
//
//  Created by Eduardo Lombardi on 06/06/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import XCTest
@testable import TesteiOS

class InvestDecoderTests: XCTestCase {
    var data:Data = Data()
    var investDecoder = InvestDecoder(data:Data())
    override func setUp() {
        super.setUp()
       
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "fund", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
                data = jsonData
            } catch {
                // handle error
            }
        }
        
        investDecoder = InvestDecoder(data: data)
        
    }
    
    
    func testDecoder() {
        guard let _ = investDecoder.decode() else {
            XCTFail()
            return
        }
    }
    
    
}
