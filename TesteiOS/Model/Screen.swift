//
//  Screen.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation

class Screen:Codable {

    let title:String
    let fundName:String
    let whatIs:String
    let definition:String
    let riskTitle:String
    let risk:Int
    let infoTitle:String
    let moreInfo:MoreInfo
    let info:Array<DataInfo>
    let downInfo:Array<DataInfo>
//
    init(title:String,fundName:String,whatIs:String,definition:String,riskTitle:String,risk:Int,infoTitle:String,moreInfo:MoreInfo,info:Array<DataInfo>,downInfo:Array<DataInfo>) {
        self.title = title
        self.fundName = fundName
        self.whatIs = whatIs
        self.definition = definition
        self.riskTitle = riskTitle
        self.risk = risk
        self.infoTitle = infoTitle
        self.moreInfo = moreInfo
        self.info = info
        self.downInfo = downInfo
    }
    
    
}
