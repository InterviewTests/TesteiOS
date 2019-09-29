//
//  InvestViewInfo.swift
//  LuizProcessoTesteSantader
//
//  Created by Luiz Otavio Processo on 27/09/19.
//  Copyright © 2019 Luiz Otavio Processo. All rights reserved.
//

import Foundation

struct InvestViewInfo:Codable{
    var screen:Screen?
}

struct Screen:Codable{
    var title:String?
    var fundName:String?
    var whatIs:String?
    var definition:String?
    var riskTitle:String?
    var risk:Int?
    var infoTitle:String?
    var moreInfo:MoreInfo?
    var info:[Info]?
    var downInfo:[DownInfo]?
}
struct MoreInfo:Codable {
    var month:IntervaloTempo?
    var year:IntervaloTempo?
    var twelveMonth: IntervaloTempo?
    
    private enum CodingKeys: String, CodingKey{
        case month, year, twelveMonth = "12months"
    }
}

struct IntervaloTempo:Codable {
    var fund:Double?
    var CDI:Double?
}

struct Info:Codable {
    var name:String?
    var data:String?
}

struct DownInfo:Codable {
    var name:String?
    var data:String?
}

