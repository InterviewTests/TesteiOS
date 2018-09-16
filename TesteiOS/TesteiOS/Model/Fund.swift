//
//  Fund.swift
//  TesteiOS
//
//  Created by Nicolau on 15/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import Foundation

struct FundScreen: Decodable {
    let screen: Screen
}

struct Screen: Decodable {
    let title: String
    let fundName: String
    let whatIs: String
    let definition: String
    let riskTitle: String
    let risk: Int
    let infoTitle: String
    let moreInfo: Fund
    let info: [FundInfo]
    let downInfo: [FundInfo]
}

struct Fund: Decodable {
    let month: FundValues
    let year: FundValues
    let _12months: FundValues
}

struct FundValues: Decodable {
    let fund: Float
    let CDI: Float
}

struct FundInfo: Decodable {
    let name: String
    let data: String?
}
