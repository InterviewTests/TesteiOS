//
//  Investment.swift
//  iOSTest
//
//  Created by erick.peripolli on 29/07/18.
//  Copyright © 2018 Erick Peripolli. All rights reserved.
//

import Foundation

struct Investment: Codable {
    let screen: Screen
}

struct Screen: Codable {
    let title: String
    let fundName: String
    let whatIs: String
    let definition: String
    let riskTitle: String
    let risk: Int
    let infoTitle: String
    
    let moreInfo: MoreInfo
    
    let info: [Info]
    
    let downInfo: [DownInfo]
    
}

struct MoreInfo: Codable {
    let month: Month
    let year: Year
    let twelveMonths: TwelveMonths
    
    private enum CodingKeys: String, CodingKey {
        case month
        case year
        case twelveMonths = "12months"
    }
    
}

struct Month: Codable {
    let fund: Float
    let CDI: Float
}

struct Year: Codable {
    let fund: Float
    let CDI: Float
}
struct TwelveMonths: Codable { // Needs the keys
    let fund: Float
    let CDI: Float
}

struct Info: Codable {
    let name: String
    let data: String
}

struct DownInfo: Codable {
    let name: String
    let data: String?
}
