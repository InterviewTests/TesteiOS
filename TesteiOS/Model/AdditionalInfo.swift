//
//  AdditionalInfo.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation

class AdditionalInfo:Codable {
    var name:String
    var info:FundInfo
    
    init(name:String,info:FundInfo) {
        self.name = name
        self.info = info
    }
}
