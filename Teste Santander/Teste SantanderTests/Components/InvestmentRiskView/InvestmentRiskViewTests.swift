//
//  InvestmentRiskViewTests.swift
//  Teste SantanderTests
//
//  Created by Eduardo Alves Sumiya on 30/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import XCTest
@testable import Teste_Santander

class InvestmentRiskViewTests: XCTestCase {
    var investmentRiskView: InvestmentRiskView!
    
    override func setUp() {
        investmentRiskView = InvestmentRiskView(frame: CGRect(x: 0, y: 0, width: 500, height: 50))
        investmentRiskView.setup(graduationRisk: .orange)
    }
    
    func testColorFill() {
        XCTAssert(investmentRiskView.stackGraduation.arrangedSubviews.count == investmentRiskView.colors.count)
    }
    
    func testColorIndicator() {
        guard let imageView = investmentRiskView.stackIconIndicator.arrangedSubviews[GraduationColorsEnum.orange.rawValue] as? UIImageView else {
            XCTAssert(false)
            return
        }
        
        XCTAssert(imageView.image != nil)
    }
}
