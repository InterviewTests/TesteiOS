//
//  Fund.swift
//  Domain
//
//  Created by Erika de Almeida Segatto on 03/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation

public struct FundValueInfo {
    public var month: (fund: Double, cdi: Double)
    public var year: (fund: Double, cdi: Double)
    public var twelveMonths: (fund: Double, cdi: Double)
    
    public init(monthFund: Double, monthCdi: Double, yearFund: Double, yearCdi: Double, twelveMonthsFund: Double, twelveMonthsCdi: Double) {
        self.month = (monthFund, monthCdi)
        self.year = (yearFund, yearCdi)
        self.twelveMonths = (twelveMonthsFund, twelveMonthsCdi)
    }
}

public struct FundInfo {
    public var name: String
    public var data: String
    
    public init(name: String, data: String) {
        self.name = name
        self.data = data
    }
}


public struct Fund {
    public let id: String
    public let title: String
    public let fundName: String
    public let whatIs: String
    public let definition: String
    public let riskTitle: String
    public let risk: Int
    public let infoTitle: String
    public let moreInfo: FundValueInfo
    public let info: [FundInfo]
    public let downInfo: [FundInfo]
    
    public init(id: String, title: String, fundName: String, whatIs: String, definition: String, riskTitle: String, risk: Int, infoTitle: String, monthFund: Double, monthCdi: Double, yearFund: Double, yearCdi: Double, twelveMonthsFund: Double, twelveMonthsCdi: Double, info: [FundInfo], downInfo: [FundInfo]) {
        self.id = id
        self.title = title
        self.fundName = fundName
        self.whatIs = whatIs
        self.definition = definition
        self.riskTitle = riskTitle
        self.risk = risk
        self.infoTitle = infoTitle
        self.moreInfo = FundValueInfo(monthFund: monthFund, monthCdi: monthCdi, yearFund: yearFund, yearCdi: yearCdi, twelveMonthsFund: twelveMonthsFund, twelveMonthsCdi: twelveMonthsCdi)
        self.info = info
        self.downInfo = downInfo
    }
}
