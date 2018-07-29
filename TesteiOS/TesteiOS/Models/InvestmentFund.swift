//
//  InvestmentFund.swift
//  TesteiOS
//
//  Created by Tiago Leme on 29/07/18.
//  Copyright © 2018 Tiago Leme. All rights reserved.
//

import Foundation

class InvestmentFund{
    
    var fundTitle: String
    var fundName: String
    var whatIs: String
    var definition: String
    var riskTitle: String
    var risk: Int
    var infoTitle: String
    var info: [(String, String)]
    var downInfo: [(String, String?)]
    var moreInfo: [(String, String, String)]
    
    init?(fundTitle: String, fundName: String, whatIs: String, definition: String, riskTitle: String, risk: Int, infoTitle: String, info: [(String, String)], moreInfo: [(String, String, String)], downInfo: [(String, String?)]) {
       
        self.fundTitle = fundTitle
        self.fundName = fundName
        self.whatIs = whatIs
        self.definition = definition
        self.riskTitle = riskTitle
        self.risk = risk
        self.infoTitle = infoTitle
        self.moreInfo = moreInfo
        self.info = info
        self.downInfo = downInfo
    }
}
