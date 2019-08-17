//
//  FundsMoreInfoPercentages.swift
//  Santander
//
//  Created by Orlando Amorim on 15/08/19.
//

import Foundation

extension FundsScreen.MoreInfo {
    struct Percentages: Decodable {
        let fund: Double
        let cdi: Double
        
        private enum CodingKeys: String, CodingKey {
            case fund
            case cdi = "CDI"
        }
    }
}
