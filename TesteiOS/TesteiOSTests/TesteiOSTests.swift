//
//  TesteiOSTests.swift
//  TesteiOSTests
//
//  Created by Nicolau on 13/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import XCTest
@testable import TesteiOS

/****************************************************
 *                                                  *
 *           ----- OBSERVAÇÃO ------                *
 * Devido à bugs em algumas versões do XCode,       *
 * rodar os testes em um simulador rodando iOS 11.x *
 *                                                  *
 ****************************************************/


class TesteiOSTests: XCTestCase {
    
    lazy var formVC: FormVC = {
        let vc = FormVC()
        return vc
    }()
    
    lazy var textField: CustomTextField = {
        let view = CustomTextField()
        return view
    }()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEmailValidation() {
        XCTAssertEqual(formVC.validateEmail(candidate: "a@a.co"), true)
        XCTAssertEqual(formVC.validateEmail(candidate: "a@a.com"), true)
        XCTAssertEqual(formVC.validateEmail(candidate: "a@a.com.br"), true)
        
        XCTAssertEqual(formVC.validateEmail(candidate: "a@acom"), false)
        XCTAssertEqual(formVC.validateEmail(candidate: "a@a.c"), false)
        XCTAssertEqual(formVC.validateEmail(candidate: "@a.c"), false)
        XCTAssertEqual(formVC.validateEmail(candidate: "a@.c"), false)
        XCTAssertEqual(formVC.validateEmail(candidate: "aa.com"), false)
        XCTAssertEqual(formVC.validateEmail(candidate: ""), false)
    }
    
    func testPhoneValidation() {
        XCTAssertEqual(formVC.validatePhone(candidate: "1111111111"), true)
        XCTAssertEqual(formVC.validatePhone(candidate: "11111111111"), true)
        
        XCTAssertEqual(formVC.validatePhone(candidate: "111111111"), false)
        XCTAssertEqual(formVC.validatePhone(candidate: "111111111111"), false)
        XCTAssertEqual(formVC.validatePhone(candidate: "qwerty"), false)
        XCTAssertEqual(formVC.validatePhone(candidate: ""), false)
    }
    
    func testTextFieldValidations() {
        textField.typeField = .text
        textField.text = "Lucas"
        XCTAssertEqual(formVC.validate(textField: textField), Status.correct)
        textField.text = ""
        XCTAssertEqual(formVC.validate(textField: textField), Status.incorrect)
        
        textField.typeField = .email
        textField.text = "a@a.com"
        XCTAssertEqual(formVC.validate(textField: textField), Status.correct)
        textField.text = "a.com"
        XCTAssertEqual(formVC.validate(textField: textField), Status.incorrect)
        
        textField.typeField = .telNumber
        textField.text = "(11) 11111-1111"
        XCTAssertEqual(formVC.validate(textField: textField), Status.correct)
        textField.text = "111111111111"
        XCTAssertEqual(formVC.validate(textField: textField), Status.incorrect)
    }
    
    func testPerformanceExample() {
        self.measure {}
    }
    
}
