//
//  InvestmentScreen.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 28/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import Foundation

struct InvestmentScreen: Decodable
{
    struct Screen: Decodable
    {
        struct MoreInfo: Decodable
        {
            struct FundCDI: Decodable
            {
                var fund: Double?
                var cdi: Double?
                
                // nome de variavel com caixa alta =P
                enum CodingKeys: String, CodingKey
                {
                    case fund
                    case cdi = "CDI"
                }
            }

            var month: FundCDI?
            var year: FundCDI?
            var months: FundCDI?

            // nome de variavel iniciando com numero =P
            enum CodingKeys: String, CodingKey
            {
                case month
                case year
                case months = "12months"
            }
        }

        struct Info: Decodable
        {
            var name: String?
            var data: String?
        }
        
        var title: String?
        var fundName: String?
        var whatIs: String?
        var definition: String?
        var riskTitle: String?
        var risk: UInt8? // range de valor baixo
        var infoTitle: String?
        var moreInfo: MoreInfo?
        var info: [Info]?
        var downInfo: [Info]?
    }
    
    var screen: Screen?
}
