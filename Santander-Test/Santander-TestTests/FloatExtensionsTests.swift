//
//  FloatExtensionsTests.swift
//  Santander-TestTests
//
//  Created by Matheus Ribeiro on 20/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import XCTest
@testable import Santander_Test

class FloatExtensionsTests: XCTestCase {

    func testBrazilianPercentFormat() {
        let numbers: [Float] = [3.0, 3.1, 3.4, 4.3, 5.59, 6.01]
        
        var formatted = numbers[0].getBrazilianPercentFormat()
        XCTAssertEqual(formatted, "3,0%")
        
        formatted = numbers[1].getBrazilianPercentFormat()
        XCTAssertEqual(formatted, "3,1%")
        
        formatted = numbers[2].getBrazilianPercentFormat()
        XCTAssertEqual(formatted, "3,4%")
        
        formatted = numbers[3].getBrazilianPercentFormat()
        XCTAssertEqual(formatted, "4,3%")
        
        formatted = numbers[4].getBrazilianPercentFormat()
        XCTAssertEqual(formatted, "5,6%")
        
        formatted = numbers[5].getBrazilianPercentFormat()
        XCTAssertEqual(formatted, "6,0%")
    }

}
