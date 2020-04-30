//
//  CustomTextFieldTests.swift
//  Teste SantanderTests
//
//  Created by Eduardo Alves Sumiya on 30/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import XCTest
@testable import Teste_Santander

class CustomTextFieldTests: XCTestCase {
    var textField: CustomTextField!
    
    override func setUp() {
        textField = CustomTextField(frame: .zero)
        textField.setup(placeHolderText: "Placeholder", inputType: .email, isRequired: false)
    }
    
    func testTextFieldDesign() {
        XCTAssert(textField.lblPlaceholder.text == "Placeholder")
    }
    
    func testValidEmail() {
        textField.txtInput.text = "email@domain.com"
        textField.inputDidChanged(textField.txtInput)
        XCTAssert(textField.viewValidationStatus.backgroundColor == ColorUtils.investment80)
    }
    
    func testWrongEmail() {
        textField.txtInput.text = "email@domaincom"
        textField.inputDidChanged(textField.txtInput)
        XCTAssert(textField.viewValidationStatus.backgroundColor == ColorUtils.buttonRed)
    }
}
