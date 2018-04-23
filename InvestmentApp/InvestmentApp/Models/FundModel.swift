//
//  FundModel.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 22/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import Foundation

struct ScreenModel: Codable {
    var screen: FundModel
}

struct FundModel: Codable {
    var title: String
    var fundName: String
    var whatIs: String
    var definition: String
    var riskTitle: String
    var risk: Int
    var infoTitle: String
    var moreInfo: MoreInfoModel
    var info: [InfoModel]
    var downInfo: [InfoModel]
}

struct MoreInfoModel: Codable {
    var month: InfoDetailModel
    var year: InfoDetailModel
    var twelveMonths: InfoDetailModel
    
    enum CodingKeys: String, CodingKey {
        case month
        case year
        case twelveMonths = "12months"
    }
}

struct InfoDetailModel: Codable {
    var fund: Float
    var CDI: Float
}

struct InfoModel: Codable {
    var name: String
    var data: String?
}
