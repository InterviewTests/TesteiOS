//
//  Funds.swift
//  TesteIOS
//
//  Created by Sidney Silva on 15/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

struct FundsScreen: Codable {
    var screen: Funds
}

struct Funds: Codable {
    var title: String
    var fundName: String
    var whatIs: String
    var definition: String
    var riskTitle: String
    var risk: Int
    var infoTitle: String
    var moreInfo: MoreInfo
    var info: [DataInfo]
    var downInfo: [DataInfo]
}

struct MoreInfo: Codable {
    var month: MoreInfoContent
    var year: MoreInfoContent
    var lastYear: MoreInfoContent
    
    enum CodingKeys:String,CodingKey {
        case month
        case year
        case lastYear = "12months"
    }
}

struct MoreInfoContent: Codable {
    var fund: Float
    var CDI: Float
}

struct DataInfo: Codable {
    var name: String
    var data: String?
}
