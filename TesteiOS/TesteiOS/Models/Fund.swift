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

struct Fund: Equatable, Codable {
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

func ==(lhs: Fund, rhs: Fund) -> Bool {
    return lhs.title == rhs.title
        && lhs.fundName == rhs.fundName
        && lhs.whatIs == rhs.whatIs
        && lhs.definition == rhs.definition
        && lhs.riskTitle == rhs.riskTitle
        && lhs.risk == rhs.risk
        && lhs.infoTitle == rhs.infoTitle
        && lhs.moreInfo == rhs.moreInfo
        && lhs.info == rhs.info
        && lhs.downInfo == rhs.downInfo
}

struct MoreInfo: Equatable, Codable {
    var month: Month
    var year: Year
    var twelveMonths: TwelveMonths
    
    enum CodingKeys : String, CodingKey {
        case month
        case year
        case twelveMonths = "12months"
    }
}

func ==(lhs: MoreInfo, rhs: MoreInfo) -> Bool {
    return lhs.month == rhs.month
        && lhs.year == rhs.year
        && lhs.twelveMonths == rhs.twelveMonths
}


struct Month: Equatable, Codable {
    var fund: Double
    var cdi: Double
    
    enum CodingKeys : String, CodingKey {
        case fund
        case cdi = "CDI"
    }
}

func ==(lhs: Month, rhs: Month) -> Bool {
    return lhs.fund == rhs.fund
        && lhs.cdi == rhs.cdi
}

struct Year: Equatable, Codable {
    var fund: Double
    var cdi: Double
    
    enum CodingKeys : String, CodingKey {
        case fund
        case cdi = "CDI"
    }
}

func ==(lhs: Year, rhs: Year) -> Bool {
    return lhs.fund == rhs.fund
        && lhs.cdi == rhs.cdi
}

struct TwelveMonths: Equatable, Codable {
    var fund: Double
    var cdi: Double
    
    enum CodingKeys : String, CodingKey {
        case fund
        case cdi = "CDI"
    }
}

func ==(lhs: TwelveMonths, rhs: TwelveMonths) -> Bool {
    return lhs.fund == rhs.fund
        && lhs.cdi == rhs.cdi
}

struct Info: Equatable, Codable {
    var name: String
    var data: String?
}

func ==(lhs: Info, rhs: Info) -> Bool {
    return lhs.name == rhs.name
        && lhs.data == rhs.data
}
