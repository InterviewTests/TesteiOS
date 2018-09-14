//
//  FundMoreInfo.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 14/09/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

struct FundMoreInfo: Codable {
    let month: FundMoreInfoDetails
    let year: FundMoreInfoDetails
    let twelveMonths: FundMoreInfoDetails
    
    enum CodingKeys: String, CodingKey {
        case month
        case year
        case twelveMonths = "12months"
    }
}
