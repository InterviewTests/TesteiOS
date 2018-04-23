//
//  ExtraTestsSpec.swift
//  InvestmentAppTests
//
//  Created by Matheus Weber on 22/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import InvestmentApp

final class ExtraTestsSpec: QuickSpec {
    override func spec() {
        describe("given elements") {
            context("testing elements") {
                beforeEach {
                    
                }
                
                afterEach {
                    
                }
                
                it("should be able to modify checkbox status") {
                    let checkbox = CheckBox()
                    checkbox.buttonClicked(sender: checkbox)
                    expect(checkbox.isChecked).to(beTruthy())
                }
                
                it("should be able to modify button color") {
                    let button = Button()
                    button.isHighlighted = true
                    expect(button.backgroundColor == UIColor.buttonBackgroundLightRed).to(beTruthy())
                }
                
                it("should be able to validate text field for text") {
                    let textField = TextField()
                    textField.type = TextFieldType.text
                    textField.text = "Test"
                    expect(textField.validField).to(beTruthy())
                }
                
                it("should be able to validate text field for email") {
                    let textField = TextField()
                    textField.type = TextFieldType.email
                    textField.text = "test@gmail.com"
                    expect(textField.validField).to(beTruthy())
                }
                
                it("should be able to validate text field for telephone") {
                    let textField = TextField()
                    textField.type = TextFieldType.telephone
                    textField.text = "(11) 11111-1111"
                    expect(textField.validField).to(beTruthy())
                }
            }
        }
    }
}
