//
//  FundInfo.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation

class FundInfo:Codable {
    var fund:Double
    var CDI:Double
    
    init(fund:Double, CDI:Double) {
        self.fund = fund
        self.CDI = CDI
    }
}
