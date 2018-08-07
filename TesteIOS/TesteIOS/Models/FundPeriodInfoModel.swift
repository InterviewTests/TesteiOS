//
//  FundPeriodInfoModel.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 03/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

protocol FundPeriodInfoModel {
    var fund: Double! { get }
    var cdi: Double! { get }
}

struct FundPeriodInfoModelFields: FundPeriodInfoModel {
    let fund: Double!
    let cdi: Double!
    
    init(json: JSONDict) {
        fund = json["fund"] as? Double ?? 0
        cdi = json["CDI"] as? Double ?? 0
    }
}
