//
//  Fund.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 21/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit
import SwiftyJSON

class Fund: NSObject {
    var title: String
    var fundName: String
    var whatIs: String
    var definition: String
    var riskTitle: String
    var risk: Int
    var infoTitle: String
    
    var moreInfo: MoreInfo
    var info:  [InfoData] = []
    var downInfo: [DownInfoData] = []
    
    
    
    init(json: JSON) {
        title = json["title"].stringValue
        fundName = json["fundName"].stringValue
        whatIs = json["whatIs"].stringValue
        definition = json["definition"].stringValue
        riskTitle = json["riskTitle"].stringValue
        risk = json["risk"].intValue
        infoTitle = json["infoTitle"].stringValue
        moreInfo = MoreInfo(json["moreInfo"])
        
        super.init()
        
        info = infoInit(json["info"])
        downInfo = downInfoInit(json["downInfo"])
    }
    
    struct MoreInfo{
        var month: MoreInfoData
        var year: MoreInfoData
        var months12: MoreInfoData
        
        init(_ json: JSON) {
            month = MoreInfoData(json["month"])
            year = MoreInfoData(json["year"])
            months12 = MoreInfoData(json["12months"])
        }
    }
    
    struct MoreInfoData {
        var found: Float
        var CDI: Float
        
        init(_ json: JSON) {
            found = json["found"].floatValue
            CDI = json["CDI"].floatValue
        }
    }
    
    func infoInit(_ json: JSON) -> [InfoData] {
        info = []
        for (_, i) in json{
            info.append(InfoData(i))
        }
        return info
    }

    struct InfoData {
        var name: String
        var data: String
        
        init(_ json: JSON) {
            name = json["name"].stringValue
            data = json["data"].stringValue
        }
    }
    
    func downInfoInit(_ json: JSON) -> [DownInfoData]{
        downInfo = []
        for (_, i) in json{
            downInfo.append(DownInfoData(i))
        }
        return downInfo
    }
    
    struct DownInfoData {
        var name: String
        var data: URL?
        
        init(_ json: JSON) {
            name = json["name"].stringValue
            data = json["data"].url
        }
    }
}
