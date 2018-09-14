//
//  FundMoreInfoDetails.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 14/09/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

struct FundMoreInfoDetails: Codable {
    let fund: Double
    let cdi: Double
    
    enum CodingKeys: String, CodingKey {
        case fund
        case cdi = "CDI"
    }
}
