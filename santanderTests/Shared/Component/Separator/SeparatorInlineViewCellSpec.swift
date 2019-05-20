//
//  SeparatorInlineViewCellSpec.swift
//  santanderTests
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import santander

class SeparatorInlineViewCellSpec: QuickSpec {
    
    override func spec() {
        
        var sut: SeparatorInlineViewCell!
        
        beforeEach {
            sut = SeparatorInlineViewCell()
            sut.frame = CGRect(x: 0, y: 0, width: 320, height: 5)
        }
        
        describe("when it is instantiate") {
            
            it("hould have properly layout", closure: {
                expect(sut).to(haveValidSnapshot(named: "SeparatorInlineViewCellSpec_none"))
            })
            
        }
        
        context("when setup style for line") {
            
            beforeEach {
                sut.style = .line
            }
            
            it("hould have properly layout", closure: {
                expect(sut).to(haveValidSnapshot(named: "SeparatorInlineViewCellSpec_line"))
            })
            
        }
        
        context("when setup style for arrow") {
            
            beforeEach {
                sut.style = .arrow
            }
            
            it("hould have properly layout", closure: {
                expect(sut).to(haveValidSnapshot(named: "SeparatorInlineViewCellSpec_arrow"))
            })
            
        }
        
    }
    
}
