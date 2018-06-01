//
//  AdditionalInfo.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation

class AdditionalInfo:Codable {
    let info:FundInfo
    
    init(info:FundInfo) {
        self.info = info
    }
}
