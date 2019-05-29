//
//  Screen.swift
//  SantanderIOS
//
//  Created by Adauto Oliveira on 29/05/19.
//  Copyright © 2019 Adauto Oliveira. All rights reserved.
//

import Foundation

struct Screen: Equatable {
    var title: String
    var fundName: String
    var whatIs: String
    var definition: String
    var riskTitle: String
    var risk: Int
    var infoTitle: String
    //    var moreInfo: [String: Any]
    var found: Double
    var CDI: Double
    //    var info: [[String: String]]?
    var name: String
    var data: String
    
}

func ==(lhs: Screen, rhs: Screen) -> Bool{
    return lhs.title == rhs.title
        && lhs.fundName == rhs.fundName
        && lhs.whatIs == rhs.whatIs
        && lhs.definition == rhs.definition
        && lhs.riskTitle == rhs.riskTitle
        && lhs.risk == rhs.risk
        && lhs.infoTitle == rhs.infoTitle
        //        && lhs.moreInfo == rhs.moreInfo
        && lhs.found == rhs.found
        && lhs.CDI == rhs.CDI
        //        && lhs.type == rhs.type
        && lhs.name == rhs.name
        && lhs.data == rhs.data
}
