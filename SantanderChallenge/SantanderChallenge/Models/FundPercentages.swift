//
// FundPercentages.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 07/07/19.
//

import Foundation

struct FundPercentages: Decodable {
    let fund: Double
    let cdi: Double
    
    var fundPresentable: String {
        return "\(fund)%"
    }
    
    var cdiPresentable: String {
        return "\(cdi)%"
    }
    
    private enum CodingKeys: String, CodingKey {
        case fund
        case cdi = "CDI"
    }
}
