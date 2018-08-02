//
//  Screen.swift
//  TesteiOS
//
//  Created by Dafle Cardoso on 02/08/2018.
//  Copyright © 2018 Dafle Cardoso. All rights reserved.
//

import Foundation

struct InvestimentResponse: Codable {
    
    let screen:Screen
}

struct Screen: Codable {
    
    let title:String
    let fundName:String
    let whatIs:String
    let definition:String
    let riskTitle: String
    let risk: Int
    let infoTitle: String
    let moreInfo:MoreInfo
    let info:[Info]
    let downInfo:[Info]
}

struct MoreInfo: Codable {
    
    let month:FundCdi
    let year:FundCdi
    let months12:FundCdi
    
    enum CodingKeys: String, CodingKey {
        case month
        case year
        case months12 = "12months"
    }
}

struct FundCdi: Codable {
    
    let fund:Double
    let CDI:Double
}

struct Info: Codable {
    
    let name:String
    let data:String?
}






