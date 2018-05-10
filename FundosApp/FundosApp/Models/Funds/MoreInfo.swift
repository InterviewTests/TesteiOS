//
//  MoreInfo.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 08/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import Foundation
struct MoreInfo: Codable {
    let month: MoreInfoValues
    let year: MoreInfoValues
    let twelveMonths: MoreInfoValues
    
    enum CodingKeys: String, CodingKey {
        case month
        case year
        case twelveMonths = "12months"
    }
}

struct MoreInfoValues: Codable {
    let fund: Double
    let CDI: Double
}
