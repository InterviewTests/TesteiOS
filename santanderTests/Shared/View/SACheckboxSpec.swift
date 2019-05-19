//
//  SACheckboxSpec.swift
//  santanderTests
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import santander

class SACheckboxSpec: QuickSpec {
    
    override func spec() {
        
        var sut: SACheckbox!
        
        beforeEach {
            sut = SACheckbox()
            sut.frame = CGRect(x: 0, y: 0, width: 19, height: 19)
        }
        
        describe("when it is instantiate") {
            it("should have properly layout for empty checkbox", closure: {
                expect(sut).to(haveValidSnapshot(named: "SACheckbox_empty"))
            })
        }
        
        context("when it is set to filled") {
            
            beforeEach {
                sut.setCheckbox(filled: true)
            }
            
            it("should have properly layout for filled checkbox", closure: {
                expect(sut).to(haveValidSnapshot(named: "SACheckbox_filled"))
            })
        }
        
    }
    
}
