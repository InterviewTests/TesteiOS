//
//  InvestFundData.swift
//  InvestApp
//
//  Created by Victor tavares on 06/06/2018.
//  Copyright © 2018 Santander. All rights reserved.
//

import Foundation

struct InvestRoot: Decodable {
    let screen: InvestData?
}

struct InvestData: Decodable {
    let title: String?
    let fundName: String?
    let whatIs: String?
    let definition: String?
    let riskTitle: String?
    let risk: Int?
    let infoTitle: String?
    let moreInfo: InvestInfo?
    let info: [InvestItemInfo]?
    let downInfo: [InvestItemInfo]?
}

struct InvestInfo: Decodable {
    let month: InvestCDI?
    let year: InvestCDI?
    let twelvemonths: InvestCDI?

    enum CodingKeys: String, CodingKey {
        case month = "month"
        case year = "year"
        case twelvemonths = "12months"
    }
}

struct InvestCDI: Decodable {
    let fund: Double?
    let CDI: Double?
}

struct InvestItemInfo: Decodable {
    let name: String?
    let data: String?
}

