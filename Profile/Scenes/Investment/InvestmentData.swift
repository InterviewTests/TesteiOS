//
//  InvestmentData.swift
//  Profile
//
//  Created by Renee Alves on 28/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation
import ObjectMapper

class InvestmentData: Mappable {
    
    var screenTitle:String??
    var investmentFundName:String?
    var whatIs:String?
    var definition:String?
    var riskTitle:String?
    var infoTitle:String?
    var monthlyFundValue:String?
    var monthlyCDIValue:String?
    var yearFundValue:String?
    var yearCDIValue:String?
    var accumulatedFundValue:String?
    var accumulatedCDIValue:String?
    
    var administrationFee:String?
    var adminstrationFeeValue:String?
    var initialApplication:String?
    var initialApplicationValue:String?
    var minMovement:String?
    var minMovementValue:String?
    var discharge:String?
    var dischargeValue:String?
    var quota:String?
    var quotaValue:String?
    var payment:String?
    var paymentValue:String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        screenTitle <- map["screen.title"]
        investmentFundName <- map["screen.fundName"]
        whatIs <- map["screen.whatIs"]
        definition <- map["screen.definition"]
        riskTitle <- map["screen.riskTitle"]
        infoTitle <- map["screen.infoTitle"]
        
        
    }
}

class InvestmentInfo: Mappable {
    
    
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
    }
}

class DownloadSpecs: Mappable {
    
    var essentials:String?
    var performance:String?
    var complementary:String?
    var statute:String?
    var adhesion:String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
    }
}
