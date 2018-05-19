//
//  FundMoreInfo.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import Foundation

class FundMoreInfo: Decodable {
    
    class MoreInfo: Decodable {
        
        var fund: Double?
        var cdi: Double?
        
        enum CodingKeys: String, CodingKey {
            case fund
            case cdi = "CDI"
        }
    }
    
    var month: MoreInfo?
    var year: MoreInfo?
    var twelveMonths: MoreInfo?
}
