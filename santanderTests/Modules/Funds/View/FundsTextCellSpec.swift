//
//  FundsTextCellSpec.swift
//  santanderTests
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import santander

class FundsTextCellSpec: QuickSpec {
    
    override func spec() {
        
        var sut: FundsTextCell!
        
        beforeEach {
            sut = FundsTextCell()
            sut.configure(data: .fullMock())
            sut.frame = CGRect(x: 0, y: 0, width: 320, height: 85)
            sut.backgroundColor = .white
        }
        
        describe("when it is instantiate", {
            
            it("should have properly layout", closure: {
                expect(sut).to(haveValidSnapshot(named: "FundsTextCellSpec"))
            })
            
        })
        
        describe("when setup without subtitle", {
            
            beforeEach {
                sut.configure(data: .titleMock())
            }
            
            it("should have properly layout", closure: {
                expect(sut).to(haveValidSnapshot(named: "FundsTextCellSpec_empty_subtitle"))
            })
            
        })
        
        describe("when setup without title", {
            
            beforeEach {
                sut.configure(data: .subtitleMock())
            }
            
            it("should have properly layout", closure: {
                expect(sut).to(haveValidSnapshot(named: "FundsTextCellSpec_empty_title"))
            })
            
        })
        
    }
    
}

extension FundsTextCell.Configuration {
    
    static func fullMock() -> FundsTextCell.Configuration {
        return .init(titleText: "O que é?",
                     titleFont: Resource.Font.medium.of(size: 16),
                     subtitleText: """
                                        O Fundo tem por objetivo proporcionar
                                        aos seus cotistas rentabilidade no longo
                                        prazo através de investimentos.
                                    """,
                     subtitleFont: Resource.Font.light.of(size: 16))
    }
    
    static func titleMock() -> FundsTextCell.Configuration {
        return .init(titleText: "O que é?",
                     titleFont: Resource.Font.medium.of(size: 16),
                     subtitleText: "",
                     subtitleFont: Resource.Font.light.of(size: 16))
    }
    
    static func subtitleMock() -> FundsTextCell.Configuration {
        return .init(titleText: "",
                     titleFont: Resource.Font.medium.of(size: 16),
                     subtitleText: """
                                        O Fundo tem por objetivo proporcionar
                                        aos seus cotistas rentabilidade no longo
                                        prazo através de investimentos.
                                    """,
                     subtitleFont: Resource.Font.light.of(size: 16))
    }
    
}
