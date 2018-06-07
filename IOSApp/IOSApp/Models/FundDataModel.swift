//
//  FundDataModel.swift
//  IOSApp
//
//  Created by Ana Beatriz Delavia Thomasi on 27/05/2018.
//  Copyright © 2018 Ana Beatriz Delavia Thomasi. All rights reserved.
//

import Foundation

struct FundDataModel : Decodable {
    
    let screen: Screen
    
}

struct Screen: Decodable {
    
    let title : String?
    let fundName : String?
    let whatIs : String?
    let definition : String?
    let riskTitle : String?
    let risk : Int?
    let infoTitle : String?
    let moreInfo : MoreInfo?
    let info : [Info]
    let downInfo : [Info]
   
}

struct MoreInfo: Decodable {
    
    let month : Revenue
    let year : Revenue
    let twelveMonths : Revenue
   
    
    enum CodingKeys: String, CodingKey {
        
        case month
        case year
        case twelveMonths = "12months"
        
    }
}

struct Revenue: Decodable {
    
    let fund : String
    let cdi :  String
    
    enum CodingKeys: String, CodingKey {
        
        case fund
        case cdi = "CDI"
        
    }
    init (from decoder: Decoder) throws{
        let container = try decoder.container (keyedBy: CodingKeys.self)
        
        fund = try String (container.decode(Double.self,forKey:CodingKeys.fund))
        cdi = try String (container.decode(Double.self,forKey:CodingKeys.cdi))
        
    }

}

struct Info : Decodable {
    
    let name : String
    let data : String?
}



