//
//  FundPercentages.swift
//  Santander
//
//  Created by Orlando Amorim on 15/08/19.
//

import Foundation

extension Investment.Funds.Response.Screen {
    struct MoreInfo: Decodable {
        let month: Percentages
        let year: Percentages
        let twelveMonths: Percentages
        
        enum CodingKeys: String, CodingKey, CaseIterable {
            case month
            case year
            case twelveMonths = "12months"
        }
        
        static func title(for key: CodingKeys) -> String {
            switch key {
            case .month:
                return "No mês"
            case .year:
                return "No Ano"
            case .twelveMonths:
                return "12 meses"
            }
        }
        
        func value(for key: CodingKeys) -> Percentages {
            switch key {
            case .month:
                return month
            case .year:
                return year
            case .twelveMonths:
                return twelveMonths
            }
        }
    }
}
