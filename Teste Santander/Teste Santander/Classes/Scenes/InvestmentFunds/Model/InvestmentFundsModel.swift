//
//  InvestmentFundsModel.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 28/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation

// MARK: - InvestmentModel
class InvestmentModel: Codable {
    let title, fundName, whatIs, definition: String
    let riskTitle: String
    let risk: Int
    let infoTitle: String
    let moreInfo: MoreInfo
    let info, downInfo: [Info]

    init(title: String, fundName: String, whatIs: String, definition: String, riskTitle: String, risk: Int, infoTitle: String, moreInfo: MoreInfo, info: [Info], downInfo: [Info]) {
        self.title = title
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

// MARK: - Info
class Info: Codable {
    let name: String
    let data: String?

    init(name: String, data: String?) {
        self.name = name
        self.data = data
    }
}

// MARK: - MoreInfo
class MoreInfo: Codable {
    let month, year, the12Months: InfoType

    enum CodingKeys: String, CodingKey {
        case month, year
        case the12Months = "12months"
    }

    init(month: InfoType, year: InfoType, the12Months: InfoType) {
        self.month = month
        self.year = year
        self.the12Months = the12Months
    }
}

// MARK: - InfoType
class InfoType: Codable {
    let fund, cdi: Double

    enum CodingKeys: String, CodingKey {
        case fund
        case cdi = "CDI"
    }

    init(fund: Double, cdi: Double) {
        self.fund = fund
        self.cdi = cdi
    }
}
