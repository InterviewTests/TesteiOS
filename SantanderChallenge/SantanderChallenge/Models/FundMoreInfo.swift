//
// FundMoreInfo.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 07/07/19.
//

import Foundation

struct FundMoreInfo: Decodable {
    let month: FundPercentages
    let year: FundPercentages
    let twelveMonths: FundPercentages
    
    private enum CodingKeys: String, CodingKey {
        case month
        case year
        case twelveMonths = "12months"
    }
}
