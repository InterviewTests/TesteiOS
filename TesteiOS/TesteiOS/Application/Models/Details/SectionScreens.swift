//
//  SectionScreens.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 08/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation

struct FundName {
    var title:String
    var name:String
}

struct WhatIs {
    var title:String
    var definition:String
}

struct RiskScreen {
    var title:String
    var risk:Int
}

struct MoreInformation {
    var title:String
    var more:MoreInfo
}

struct SectionScreens {
    var fundName:FundName?
    var whatId:WhatIs?
    var riskScreen:RiskScreen?
    var moreInformation:MoreInformation?
    var info:[Info]?
    var downInfo:[DownInfo]?
}
