//
//  FundScreen.swift
//  Santander
//
//  Created by Orlando Amorim on 15/08/19.
//

import Foundation

struct Funds: Decodable {
    let title: String
    let fundName: String
    let whatIs: String
    let definition: String
    let riskTitle: String
    let risk: Risk
    let infoTitle: String
    let info: [Info]
    let downInfo: [DownInfo]
}
