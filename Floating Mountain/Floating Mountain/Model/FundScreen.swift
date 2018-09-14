//
//  FundScreen.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 14/09/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

struct FundScreen: Codable {
    let title: String
    let fundName: String
    let whatIs: String
    let definition: String
    let riskTitle: String
    let risk: Int
    let infoTitle: String
    let moreInfo: FundMoreInfo
    let info: [FundInfoDetails]
    let downInfo: [FundInfoDetails]
}
