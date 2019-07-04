//
//  InvestmentModel.swift
//  Teste Santander
//
//  Created by Luann Marques Luna on 03/07/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import SwiftyJSON

class InvestimentScreen {
    let title: String
    let fundName: String
    let whatIs: String
    let definition: String
    let riskTitle: String
    let risk: Int
    let infoTitle: String
    let moreInfo: MoreInfo
    let info: [Info]
    let downInfo: [Info]
    
    init(_ json: JSON) {
        self.title = json["title"].stringValue
        self.fundName = json["fundName"].stringValue
        self.whatIs = json["whatIs"].stringValue
        self.definition = json["definition"].stringValue
        self.riskTitle = json["riskTitle"].stringValue
        self.risk = json["risk"].intValue
        self.infoTitle = json["infoTitle"].stringValue
        self.moreInfo = MoreInfo(json["moreInfo"])
        
        var info = [Info]()
        for infoItem in json["info"].arrayValue {
            info.append(Info(infoItem))
        }
        self.info = info
        
        var downInfo = [Info]()
        for downItem in json["info"].arrayValue {
            downInfo.append(Info(downItem))
        }
        self.downInfo = downInfo
    }
}

class Info {
    let title: String
    let value: String
    
    init(_ json: JSON) {
        self.title = json["name"].stringValue
        self.value = json["data"].stringValue
    }
}

class MoreInfo {
    let month: _moreInfoCell
    let year: _moreInfoCell
    let twelveMonths: _moreInfoCell
    
    init(_ json: JSON) {
        self.month = _moreInfoCell(json["month"])
        self.year = _moreInfoCell(json["year"])
        self.twelveMonths = _moreInfoCell(json["12months"])
    }
}

class _moreInfoCell {
    let fund: Double
    let CDI: Double
    
    init(_ json: JSON) {
        self.fund = json["fund"].doubleValue
        self.CDI = json["CDI"].doubleValue
    }
}
