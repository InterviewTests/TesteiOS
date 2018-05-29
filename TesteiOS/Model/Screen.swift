//
//  Screen.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation

class Screen {

    var title:String
    var fundName:String
    var whatIs:String
    var definition:String
    var riskTitle:String
    var risk:Int
    var infoTitle:String
    var moreInfo:AdditionalInfo
    var info:Array<Any>
    var downInfo:Array<Any>
    
    init(title:String,fundName:String,whatIs:String,definition:String,riskTitle:String,risk:Int,infoTitle:String,moreInfo:AdditionalInfo,info:Array<Any>,downInfo:Array<Any>) {
        self.title = title
        self.fundName = fundName
        self.whatIs = whatIs
        self.definition = definition
        self.riskTitle = riskTitle
        self.risk = risk
        self.infoTitle=infoTitle
        self.moreInfo = moreInfo
        self.info = info
        self.downInfo = downInfo
    }
    
    
}
