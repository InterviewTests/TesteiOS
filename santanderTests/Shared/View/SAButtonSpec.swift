//
//  SAButtonSpec.swift
//  santanderTests
//
//  Created by Jonatha Lima on 18/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import santander

class SAButtonSpec: QuickSpec {

    override func spec() {
        
        var sut: SAButton!
        
        beforeEach {
            sut = SAButton(titled: "santander button")
            sut.frame = CGRect(x: 0, y: 0, width: 320, height: 40)
            sut.isRounded = true
        }
        
        describe("SAButtonSpec") {
            
            it("should have properly layout", closure: {
                expect(sut).to(haveValidSnapshot(named: "SAButtonSpec"))
            })
            
        }
        
    }

}
