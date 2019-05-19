//
//  FundsHeaderViewCellSpec.swift
//  santanderTests
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import santander

class FundsHeaderViewCellSpec: QuickSpec {
    
    override func spec() {
        
        var sut: FundsHeaderViewCell!
        var configuration: FundsHeaderViewCell.Configuration!
        var reuseIdentifier: String!
        
        beforeEach {
            configuration = .init(title: "Fundos de investimento",
                                  subtitle: "Vinci Valorem FI Multimercado")
            sut = FundsHeaderViewCell(configuration: configuration)
            sut.frame = CGRect(x: 0, y: 0, width: 212, height: 108)
            sut.backgroundColor = .white
        }
        
        describe("when it is instantiate", {
            
            it("should have properly layout", closure: {
                expect(sut).to(haveValidSnapshot(named: "FundsHeaderViewCellSpec"))
            })
            
        })
        
        context("when reuseIdentifier is inject") {
            
            beforeEach {
                reuseIdentifier = "FundsHeaderViewCell"
                sut = FundsHeaderViewCell(configuration: configuration,
                                          reuseIdentifier: reuseIdentifier)
            }
            
            it("should bet set correctly", closure: {
                expect(sut.reuseIdentifier).to(equal(reuseIdentifier))
            })
        }
        
    }
    
}
