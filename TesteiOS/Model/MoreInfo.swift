//
//  MoreInfo.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 01/06/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation


class MoreInfo:Codable {
    
    let month:FundInfo
    let year:FundInfo
    let allMonths:FundInfo
    
    init(month:FundInfo,year:FundInfo,allMonths:FundInfo) {
        self.month = month
        self.year = year
        self.allMonths = allMonths
        
    }
    
    private enum CodingKeys : String, CodingKey {
            case month,year, allMonths = "12months"
        }
    
}
