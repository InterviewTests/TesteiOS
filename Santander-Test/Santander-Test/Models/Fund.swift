//
//  Fund.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 13/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import Foundation

struct FundsList: Decodable {
    let screen: Fund?
}


struct Fund: Decodable {
    let title: String?
    let fundName: String?
    let whatIs: String?
    let definition: String?
    let riskTitle: String?
    let risk: Int?
    let infoTitle: String?
    let moreInfo: FundMoreInfo?
    let info: [FundInfo]?
    let downInfo: [FundInfo]?
}

struct FundMoreInfo: Decodable {
    let month: FundMoreInfoMonth?
    let year: FundMoreInfoYear?
    let twelveMonths: FundMoreInfo12Months?
    
    enum CodingKeys: String, CodingKey {
        case month
        case year
        case twelveMonths = "12months"
    }
}

// TODO

struct FundMoreInfoMonth: Decodable {
    let fund: Float?
    let CDI: Float?
}

struct FundMoreInfoYear: Decodable {
    let fund: Float?
    let CDI: Float?
}

struct FundMoreInfo12Months: Decodable {
    let fund: Float?
    let CDI: Float?
}

struct FundInfo: Decodable {
    let name: String?
    let data: String?
}
