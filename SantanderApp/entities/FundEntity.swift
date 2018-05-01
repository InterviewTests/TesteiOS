//
//  FundEntity.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 24/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit
import ObjectMapper
class Screen: Mappable{
    
    var screenData: ScreenInfo?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.screenData <- map["screen"]
    }
}
class ScreenInfo: Mappable{
    
    var title: String?
    var fundName: String?
    var whatIs: String?
    var definition: String?
    var riskTitle: String?
    var risk: Int?
    var infoTitle: String?
    var moreInfo: MoreInfoScreen?
    
    var info: [String:String]?
    var downinfo: [String:String]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        self.title <- map["title"]
        self.fundName <- map["fundName"]
        self.whatIs <- map["whatIs"]
        self.definition <- map["definition"]
        self.riskTitle <- map["riskTitle"]
        self.risk <- map["risk"]
        self.infoTitle <- map["infoTitle"]
        self.moreInfo <- map["moreInfo"]
    }
}

class MoreInfoScreen: Mappable{
    
    var month: [String:Double]?
    var year: [String:Double]?
    var twelvemonths: [String:Double]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        self.month <- map["month"]
        self.year <- map["year"]
        self.twelvemonths <- map["12months"]
        
    }
}

