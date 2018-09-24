//
//  ScreenInfo.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import Foundation



struct ScreenMoreInfo : Codable {
    var month           : Fund?
    var year            : Fund?
    var twelveMonths    : Fund?
    
    private enum CodingKeys : String, CodingKey {
        case month          = "month"
        case year           = "year"
        case twelveMonths   = "12months"
    }
    
    init(from decoder : Decoder)throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.month = try? container.decode(Fund.self, forKey: .month)
        self.year  = try? container.decode(Fund.self, forKey: .year)
        self.twelveMonths = try? container.decode(Fund.self, forKey: .twelveMonths)
        
        self.month?.title   = "No Mês"
        self.year?.title    = "No Ano"
        self.twelveMonths?.title = "12 meses"
    }
}
