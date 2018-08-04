//
//  FundModel.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 03/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

protocol FundModel {
    var title: String! { get }
    var fundName: String! { get }
    var whatIs: String! { get }
    var definition: String! { get }
    var riskTitle: String! { get }
    var risk: Int! { get }
    var infoTitle: String! { get }
    
    //Info
    var moreInfo: [FundPeriodInfoModel]! { get }
    var info: [FundInfoModel]! { get }
    var downInfo: [FundInfoModel]! { get }
}

struct FundModelFields: FundModel {
    let title: String!
    let fundName: String!
    let whatIs: String!
    let definition: String!
    let riskTitle: String!
    let risk: Int!
    let infoTitle: String!
    
    //Info
    let moreInfo: [FundPeriodInfoModel]!
    let info: [FundInfoModel]!
    let downInfo: [FundInfoModel]!
}
