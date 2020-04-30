//
//  RedRoundedButtonTests.swift
//  Teste SantanderTests
//
//  Created by Eduardo Alves Sumiya on 30/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import XCTest
@testable import Teste_Santander

class RedRoundedButtonTests: XCTestCase {

    var button: RedRoundedButton!
    
    override func setUp() {
        button = RedRoundedButton(frame: .zero)
    }
    
    func testButtonDesign() throws {
        XCTAssert(button.backgroundColor == ColorUtils.buttonRed)
    }
}
