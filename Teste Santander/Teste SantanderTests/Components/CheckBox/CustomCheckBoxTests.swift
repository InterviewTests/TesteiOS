//
//  CustomCheckBoxTests.swift
//  Teste SantanderTests
//
//  Created by Eduardo Alves Sumiya on 30/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import XCTest
@testable import Teste_Santander

class CustomCheckBoxTests: XCTestCase {
    
    var checkBox: CustomCheckBox!
    
    override func setUp() {
        checkBox = CustomCheckBox(frame: .zero)
        checkBox.setup(checkBoxText: "Sample Text", isSelected: true)
    }
    
    func testCheckBoxDesign() throws {
        XCTAssert(checkBox.btnCheck.backgroundColor == ColorUtils.buttonRed)
    }
    
    func testCheckBoxToggle() throws {
        checkBox.didCheck(nil)
        XCTAssert(checkBox.getCheckState() == false)
    }
}
