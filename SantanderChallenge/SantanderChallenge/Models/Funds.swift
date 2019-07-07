//
// Funds.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 07/07/19.
//

import Foundation

struct Funds: Decodable {
    let title: String
    let fundName: String
    let whatIs: String
    let definition: String
    let riskTitle: String
    let risk: Int
    let infoTitle: String
    let moreInfo: FundMoreInfo
    let info: [FundInfo]
    let downInfo: [DownInfo]
}
