//
//  Fund.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import Foundation

struct FundContainer: Codable {
    var fund: Fund
    
    enum CodingKeys : String, CodingKey {
        case fund = "screen"
    }
}

struct Fund: Codable {
    enum Risk: Int {
        case one = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
    }
    
    var title: String
    var fundName: String
    var whatIs: String
    var definition: String
    var riskTitle: String
    var risk: Int // Risk
    var infoTitle: String
    var moreInfo: MoreInfo
    var info: [Info]
    var downInfo: [Info]
}

struct MoreInfo: Codable {
    var month: Month
    var year: Year
    var twelveMonths: TwelveMonths
    
    enum CodingKeys : String, CodingKey {
        case month
        case year
        case twelveMonths = "12months"
    }
}

struct Month: Codable {
    var fund: Double
    var cdi: Double
    
    enum CodingKeys : String, CodingKey {
        case fund
        case cdi = "CDI"
    }
}

struct Year: Codable {
    var fund: Double
    var cdi: Double
    
    enum CodingKeys : String, CodingKey {
        case fund
        case cdi = "CDI"
    }
}

struct TwelveMonths: Codable {
    var fund: Double
    var cdi: Double
    
    enum CodingKeys : String, CodingKey {
        case fund
        case cdi = "CDI"
    }
}

struct Info: Codable {
    var name: String
    var data: String?
}
