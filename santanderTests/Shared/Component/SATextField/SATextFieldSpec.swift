//
//  SATextFieldSpec.swift
//  santanderTests
//
//  Created by Jonatha Lima on 18/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import santander

class SATextFieldSpec: QuickSpec {

    override func spec() {
        
        var sut: SATextField!
        var text: String!
        
        beforeEach {
            sut = SATextField(titled: "Title")
            sut.frame = CGRect(x: 0, y: 0, width: 320, height: 56)
            sut.backgroundColor = .white
        }
        
        describe("when it is instantiate") {
            
            it("should have properly layout", closure: {
                expect(sut).to(haveValidSnapshot(named: "SATextFieldSpec"))
            })
            
        }
        
        context("when set text") {
            beforeEach {
                text = "Testing textfield input"
                sut.setText(text)
            }
            
            it("should have properly layout", closure: {
                expect(sut.getText()).to(equal(text))
            })
        }
        
    }
    
}
