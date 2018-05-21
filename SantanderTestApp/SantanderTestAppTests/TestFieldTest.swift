//
//  TestFieldTest.swift
//  SantanderTestAppTests
//
//  Created by Frederico Franco on 20/05/18.
//  Copyright © 2018 Frederico Franco. All rights reserved.
//

import XCTest
import UIKit
@testable import SantanderTestApp
import FBSnapshotTestCase

class TestFieldTest: FBSnapshotTestCase {
    
    var state = MockTextFieldInput(title: "Nome", typedText: "Fred", isValid: nil, isTextFieldActive: false)
    
    var textField: TextField = {
        let t = TextField(frame: CGRect(x: 0, y: 0, width: 300, height: 60))
        t.titleLabel.backgroundColor = #colorLiteral(red: 0.862745098, green: 1, blue: 1, alpha: 1)
        t.textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 0.9113498264, alpha: 1)
        return t
    }()
    
    let longString = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec ligula mollis, euismod tellus ut, interdum arcu. Donec eu porta purus, a cursus ipsum."
    
    override func setUp() {
        super.setUp()
        
        state = MockTextFieldInput(title: "Nome", typedText: "Fred", isValid: nil, isTextFieldActive: false)
    }
    
    override func tearDown() {
        super.tearDown()
        
        recordMode = false
    }
    
    func testIfValidLineUpdatesItsValue() {
        state.isValid = true
        textField.input = state
        XCTAssert(textField.lineView.backgroundColor == textField.appearance.validLineColor)
        
        state.isValid = false
        textField.input = state
        XCTAssert(textField.lineView.backgroundColor == textField.appearance.errorLineColor)
        
        state.isValid = nil
        textField.input = state
        XCTAssert(textField.lineView.backgroundColor == textField.appearance.normalLineColor)
    }
    
    func testIfTitleLabelPermitsJustOneLineOfContent() {
        XCTAssert(textField.titleLabel.numberOfLines == 1)
    }
    
    func testNoTypedTextAndActiveTextField() {
        state.isTextFieldActive = true
        state.typedText = ""
        
        textField.input = state
        
        FBSnapshotVerifyView(textField)
    }
    
    func testNoTypedTextAndDisabledTextField() {
        state.typedText = ""
        state.isTextFieldActive = false
        
        textField.input = state
        
        FBSnapshotVerifyView(textField)
    }
    
    func testTypedText() {
        state.typedText = longString
        
        textField.input = state
        
        FBSnapshotVerifyView(textField)
    }
    
    func testTapOnViewToClearText() {
        state.typedText = "Alguma coisa"
        textField.input = state
        
        XCTAssert(textField.clearTypedTextView.isHidden == false)
        
        textField.clearTypedText()
        
        XCTAssert(textField.input.typedText == "")
        XCTAssert(textField.clearTypedTextView.isHidden == true)
    }
    
}
