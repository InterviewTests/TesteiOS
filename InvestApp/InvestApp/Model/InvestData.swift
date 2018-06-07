//
//  InvestFundData.swift
//  InvestApp
//
//  Created by Victor tavares on 06/06/2018.
//  Copyright © 2018 Santander. All rights reserved.
//

import Foundation

struct InvestCDI: Decodable {
    let fund: Double?
    let CDI: Double?
}

struct InvestItemInfo: Decodable {
    let name: String?
    let data: String?
}

struct InvestData: Decodable {
    let title: String?
    let fundName: String?
    let whatIs: String?
    let definition: String?
    let riskTitle: String?
    let risk: Int?
    let infoTitle: String?
    let monthInfo: InvestCDI?
    let yearInfo: InvestCDI?
    let twelveMonthsInfo: InvestCDI?
    let infos: [InvestItemInfo]?
    let downInfos: [InvestItemInfo]?
}

