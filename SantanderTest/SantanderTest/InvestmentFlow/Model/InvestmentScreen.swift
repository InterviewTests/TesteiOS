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
                let fund: Float?
                let cdi: Float?
                
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
            let name: String?
            let data: String?
        }
        
        let title: String?
        let fundName: String?
        let whatIs: String?
        let definition: String?
        let riskTitle: String?
        var risk: UInt8? // range de valor baixo
        let infoTitle: String?
        var moreInfo: MoreInfo?
        var info: [Info]?
        var downInfo: [Info]?
    }
    
    var screen: Screen?
}
