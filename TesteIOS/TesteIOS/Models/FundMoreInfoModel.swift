//
//  FundPeriodMoreInfoModel.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 06/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

protocol FundMoreInfoModel {
    var month: FundPeriodInfoModel { get }
    var year: FundPeriodInfoModel { get }
    var twelveMonths: FundPeriodInfoModel { get }
}

struct FundMoreInfoModelFields: FundMoreInfoModel {
    var month: FundPeriodInfoModel
    var year: FundPeriodInfoModel
    var twelveMonths: FundPeriodInfoModel
    
    init(json: JSONDict){
        let monthJson = json["month"] as? JSONDict ?? [:]
        month = FundPeriodInfoModelFields(json: monthJson)
        
        let yearJson = json["year"] as? JSONDict ?? [:]
        year = FundPeriodInfoModelFields(json: yearJson)
        
        let twelveMonthsJson = json["12months"] as? JSONDict ?? [:]
        twelveMonths = FundPeriodInfoModelFields(json: twelveMonthsJson)
    }
}
