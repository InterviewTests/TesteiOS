//
//  Screen.swift
//  Santander
//
//  Created by Jonathan Martins on 08/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import Foundation

struct RootScreen: Decodable {
    
    let screen: Screen?
    
    enum CodingKeys: String, CodingKey {
        case screen = "screen"
    }
}

class Screen: Decodable {
    
    let title: String?
    let fundName: String?
    let whatIs: String?
    let definition: String?
    let riskTitle: String?
    let risk: Int?
    let infoTitle: String?
    private let moreInfo: MoreInfo?
    let info: [Info]?
    let downInfo: [Info]?
    var profitabilities:[Profitability] = []
    
    enum CodingKeys: String, CodingKey {
        case title      = "title"
        case fundName   = "fundName"
        case whatIs     = "whatIs"
        case definition = "definition"
        case riskTitle  = "riskTitle"
        case risk       = "risk"
        case infoTitle  = "infoTitle"
        case moreInfo   = "moreInfo"
        case info       = "info"
        case downInfo   = "downInfo"
    }
    
    /// Converts the "moreInfo" attribute to an array
    func profitabilityToArray(){
        profitabilities.append(moreInfo?.month        ?? Profitability())
        profitabilities.append(moreInfo?.year         ?? Profitability())
        profitabilities.append(moreInfo?.twelveMonths ?? Profitability())
    }
}

struct Info: Decodable {
    
    let name: String?
    let data: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case data = "data"
    }
}

struct MoreInfo: Decodable {
    
    let month:        Profitability?
    let year:         Profitability?
    let twelveMonths: Profitability?
    
    enum CodingKeys: String, CodingKey {
        case month        = "month"
        case year         = "year"
        case twelveMonths = "12months"
    }
}

struct Profitability: Decodable {
    
    var fund: Double?
    var cdi:  Double?
    
    enum CodingKeys: String, CodingKey {
        case fund = "fund"
        case cdi  = "CDI"
    }
}
