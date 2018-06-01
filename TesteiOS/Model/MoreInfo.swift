//
//  MoreInfo.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 01/06/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation


class MoreInfo:Codable {
    
    var month:AdditionalInfo
    var year:AdditionalInfo
    var allMonths:AdditionalInfo
    
    init(month:AdditionalInfo,year:AdditionalInfo,allMonths:AdditionalInfo) {
        self.month = month
        self.year = year
        self.allMonths = allMonths
        
    }
    
    
}
