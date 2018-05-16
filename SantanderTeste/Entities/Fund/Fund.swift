//
//  Fund.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import Foundation

class FundScreen: Decodable {
    
    var screen: Fund?
}

class Fund: Decodable {
    
    var title: String?
    var name: String?
    var whatIsTitle: String?
    var description: String?
    var riskTitle: String?
    var risk: Int?
    var moreInfoTitle: String?
    var moreInfo: FundMoreInfo?
    var info: [FundInfo]?
    var downInfo: [FundInfo]?
    
    enum CodingKeys: String, CodingKey {
        case title
        case name = "fundName"
        case whatIsTitle = "whatIs"
        case description = "definition"
        case riskTitle
        case risk
        case moreInfoTitle = "infoTitle"
        case moreInfo
        case info
        case downInfo
    }
}
