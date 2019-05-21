//
//  FundsThreeColumnsCellSpec.swift
//  santanderTests
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import santander

class FundsThreeColumnsCellSpec: QuickSpec {
    
    override func spec() {
        
        var sut: FundsThreeColumnsCell!
        
        beforeEach {
            sut = FundsThreeColumnsCell()
            sut.frame = CGRect(x: 0, y: 0, width: 320, height: 32)
            sut.backgroundColor = .white
        }
        
        describe("when it is setup without first column", {
            
            beforeEach {
                sut.configure(data: .mockWithoutFirstColumn())
            }
            
            it("should have properly layout", closure: {
                expect(sut).to(haveValidSnapshot(named: "FundsThreeColumnsCellSpec_withoutFirstColumn"))
            })
            
        })
        
        context("when it is instantiate with all columns", {
            
            beforeEach {
                sut.configure(data: .mockFull())
            }
            
            it("should have properly layout", closure: {
                expect(sut).to(haveValidSnapshot(named: "FundsThreeColumnsCellSpec_allColums"))
            })
            
        })
        
        context("when it is instantiate with key and value", {
            
            beforeEach {
                sut.configure(data: .mockKeyVakue())
            }
            
            it("should have properly layout", closure: {
                expect(sut).to(haveValidSnapshot(named: "FundsThreeColumnsCellSpec_keyValue"))
            })
            
        })
        
    }
    
}

extension FundsThreeColumnsCell.Configuration {
    
    static func mockWithoutFirstColumn() -> FundsThreeColumnsCell.Configuration {
        
        return .init(firstColumn: nil,
                     secondColumn: ("Fundo", Resource.Color.lightGray),
                     thirdColumn: ("CDI", Resource.Color.lightGray))
        
    }
    
    static func mockFull() -> FundsThreeColumnsCell.Configuration {
        
        return .init(firstColumn: ("No mês", Resource.Color.lightGray),
                     secondColumn: ("0,3%", Resource.Color.black),
                     thirdColumn: ("0,3%", Resource.Color.black))
        
    }
    
    static func mockKeyVakue() -> FundsThreeColumnsCell.Configuration {
        
        return .init(firstColumn: ("Movimentação mínima", Resource.Color.lightGray),
                     secondColumn: nil,
                     thirdColumn: ("R$ 1.000,00", Resource.Color.black))
        
    }
    
}
