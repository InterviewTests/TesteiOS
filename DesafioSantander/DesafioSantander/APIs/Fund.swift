//
//  Fund.swift
//  DesafioSantander
//
//  Created by Fernanda de Lima on 30/09/18.
//  Copyright © 2018 FeLima. All rights reserved.
//

import Foundation
import ObjectMapper

struct FundModal{
    var screen:Screen?
    
    init(screen: Screen?) {
        self.screen = screen
    }
}

class Screen: Mappable{
    
    var title:String?
    var fundName:String?
    var whatIs:String?
    var definition:String?
    var riskTitle:String?
    var risk: Int?
    var infoTitle:String?
    var moreInfo:MoreInfo?
    var info:[Infos]?
    var downInfo:[Infos]?
    
    required init?(map: Map){
        mapping(map: map)
    }
    
    func mapping(map:Map){
        title       <- map["title"]
        fundName    <- map["fundName"]
        whatIs      <- map["whatIs"]
        definition  <- map["definition"]
        riskTitle   <- map["riskTitle"]
        risk        <- map["risk"]
        infoTitle   <- map["infoTitle"]
        moreInfo    <- map["moreInfo"]
        info        <- map["info"]
        downInfo    <- map["downInfo"]
    }
}

class MoreInfo:Mappable{
    var month:Numeros?
    var year:Numeros?
    var dozeMonths:Numeros?
    
    
    required init?(map: Map){
        mapping(map: map)
    }
    
    func mapping(map:Map){
        month       <- map["month"]
        year        <- map["year"]
        dozeMonths  <- map["12months"]
    }
}

class Numeros: Mappable  {
    
    var fund:Int?
    var CDI:Int?
    
    required init?(map: Map){
        mapping(map: map)
    }
    
    func mapping(map:Map){
        fund    <- map["fund"]
        CDI     <- map["CDI"]
    }
}

class Infos: Mappable  {
    
    var name:String?
    var data:String?
    
    required init?(map: Map){
        mapping(map: map)
    }
    
    func mapping(map:Map){
        name    <- map["name"]
        data    <- map["data"]
    }
}


extension FundModal: Mappable  {
    init?(map: Map){
        mapping(map: map)
    }
    
    mutating func mapping(map:Map){
        screen     <- map["screen"]
    }
}
