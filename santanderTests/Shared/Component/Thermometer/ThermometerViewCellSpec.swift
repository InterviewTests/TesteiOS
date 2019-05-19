//
//  ThermometerViewCellSpec.swift
//  santanderTests
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Foundation

import Quick
import Nimble
import Nimble_Snapshots

@testable import santander

class ThermometerViewCellSpec: QuickSpec {
    
    override func spec() {
        
        var sut: ThermometerViewCell!
        
        beforeEach {
            sut = ThermometerViewCell()
            sut.frame = CGRect(x: 0, y: 0, width: 320, height: 25)
        }
        
        describe("when it is instantiate", {
            
            it("should have properly layout", closure: {
                expect(sut).to(haveValidSnapshot(named: "FundsHeaderViewCellSpec"))
            })
            
        })
        
    }
    
}
