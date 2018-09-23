//
//  InvestimentoModel.swift
//  Teste_iOS_Santander
//
//  Created by Fabricio Rodrigues on 20/09/2018.
//  Copyright © 2018 Fabricio Rodrigues. All rights reserved.
//

import UIKit
import ObjectMapper

struct InvestimentoModel: Mappable {
    
    var investData: [InvestimentoObjectMapper]

    init?(map: Map) {
        do {
            investData = try map.value("screen")
        } catch {
            return nil
        }
    }
    
    mutating func mapping(map: Map) {

    }
    
}

struct InvestimentoObjectMapper: Mappable {
    var title: String?
    var fundName: String?
    var whatIs: String?
    var definition: String?
    var riskTitle: String?
    var risk: Int?
    var infoTitle: String?
    var monthInfo: [String: Double]?
    var yearInfo: [String: Double]?
    var lastInfo: [String: Double]?
    var info: Array<[String: Any]>?
    var downInfo: Array<[String: Any]>?

    
    init?(map: Map) {
        
    }
    
    // Mappable
    mutating func mapping(map: Map) {
        title    <- map["title"]
        fundName    <- map["fundName"]
        whatIs    <- map["whatIs"]
        definition    <- map["definition"]
        riskTitle    <- map["riskTitle"]
        risk    <- map["risk"]
        infoTitle    <- map["infoTitle"]
        monthInfo <-  map["moreInfo.month"]
        yearInfo <-  map["moreInfo.year"]
        lastInfo <- map["moreInfo.12months"]
        info    <- map["info"]
        downInfo    <- map["downInfo"]
    }
    
}

struct MoreInfo: Mappable {
    
    var moreInfo: [String : Any]?
    
    init?(map: Map) {
        
    }
    
    // Mappable
    mutating func mapping(map: Map) {
        moreInfo <- map["cells"]
        
    }
}



