//
//  Fund.swift
//  TesteiOS
//
//  Created by lucas.eiji.saito on 29/06/18.
//  Copyright © 2018 Accenture. All rights reserved.
//

import Foundation

struct Fund: Decodable {
    let screen: Screen
}

struct Screen: Decodable {
    let title: String?
    let fundName: String?
    let whatIs: String?
    let definition: String?
    let riskTitle: String?
    let risk: Int?
    let infoTitle: String?
    let moreInfo: MoreInfo?
    let info: [Info]
    let downInfo: [Info]
}

struct MoreInfo: Decodable {
    let month: MoreInfoDetail?
    let year: MoreInfoDetail?
    let twelveMonths: MoreInfoDetail?
    
    enum CodingKeys: String, CodingKey {
        case month = "month"
        case year = "year"
        case twelveMonths = "12months"
    }
}

struct MoreInfoDetail: Decodable {
    let fund: Float?
    let cdi: Float?
    
    enum CodingKeys: String, CodingKey {
        case fund = "fund"
        case cdi = "CDI"
    }
}

struct Info: Decodable {
    let name: String?
    let data: String?
}
