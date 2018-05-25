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
    
    var state = TextFieldModel(title: "Nome", typedText: "Fred", validator: nil, isTextFieldActive: false)
    
    var textField: TextField = {
        let t = TextField(frame: CGRect(x: 0, y: 0, width: 300, height: 60))
        t.titleLabel.backgroundColor = #colorLiteral(red: 0.862745098, green: 1, blue: 1, alpha: 1)
        t.textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 0.9113498264, alpha: 1)
        return t
    }()
    
    let longString = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec ligula mollis, euismod tellus ut, interdum arcu. Donec eu porta purus, a cursus ipsum."
    
    override func setUp() {
        super.setUp()
        
        state = TextFieldModel(title: "Nome", typedText: "Fred")
    }
    
    override func tearDown() {
        super.tearDown()
        
        recordMode = false
    }
    
    func testIfValidLineUpdatesItsValue() {
        let validator = MockValidator()
        var state = TextFieldModel(title: "Nome", typedText: "Fred", validator: validator)
        
        let _ = try? state.validateTypedText()
        textField.model = state
        XCTAssert(textField.lineView.backgroundColor == textField.appearance.validLineColor)
        
        validator.handlerIsValidText = { _ in return false }
        let _ = try? state.validateTypedText()
        textField.model = state
        XCTAssert(textField.lineView.backgroundColor == textField.appearance.errorLineColor)
        
        textField.model = TextFieldModel(title: "Nome", typedText: "Fred", validator: nil)
        XCTAssert(textField.lineView.backgroundColor == textField.appearance.normalLineColor)
    }
    
    func testIfTitleLabelPermitsJustOneLineOfContent() {
        XCTAssert(textField.titleLabel.numberOfLines == 1)
    }
    
    func testNoTypedTextAndActiveTextField() {
        state.isTextFieldActive = true
        try! state.changeTypedText(with: "")
        
        textField.model = state
        
        FBSnapshotVerifyView(textField)
    }
    
    func testNoTypedTextAndDisabledTextField() {
        state.isTextFieldActive = false
        try! state.changeTypedText(with: "")
        
        textField.model = state
        
        FBSnapshotVerifyView(textField)
    }
    
    func testTypedText() {
        try! state.changeTypedText(with: longString)
        
        textField.model = state
        
        FBSnapshotVerifyView(textField)
    }
    
    func testTapOnViewToClearText() {
        try! state.changeTypedText(with: "Alguma coisa")
        textField.model = state
        
        XCTAssert(textField.clearTypedTextView.isHidden == false)
        
        textField.model.clearTypedText()
        
        XCTAssert(textField.model.typedText == "")
        XCTAssert(textField.clearTypedTextView.isHidden == true)
    }
    
}
