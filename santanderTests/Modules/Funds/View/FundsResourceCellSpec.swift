//
//  FundsResourceCellSpec.swift
//  santanderTests
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import santander

class FundsResourceCellSpec: QuickSpec {
    
    override func spec() {
        
        var sut: FundsResourceCell!
        var configuration: FundsResourceCell.Configuration!
        
        beforeEach {
            configuration =
                .init(title: "Essenciais",
                      resource: ("Baixar",
                                 Resource.Image.download.image))
            
            sut = FundsResourceCell()
            sut.configure(data: configuration)
            sut.frame = CGRect(x: 0, y: 0, width: 320, height: 32)
            sut.backgroundColor = .white
        }
        
        describe("when it is instantiate", {
            
            it("should have properly layout", closure: {
                expect(sut).to(haveValidSnapshot(named: "FundsResourceCellSpec"))
            })
            
        })
        
    }
    
}
