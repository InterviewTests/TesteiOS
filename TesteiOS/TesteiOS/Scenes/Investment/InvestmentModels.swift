//
//  InvestmentModels.swift
//  TesteiOS
//
//  Created by Ricardo Suman on 01/05/2018.
//  Copyright © 2018 Ricardo Suman. All rights reserved.
//

import UIKit

extension Investment.FundsEntity: JSONCodable {}

enum Investment {
    struct FundsEntity: Codable {
        let screen: Funds
        
        enum CodingKeys: String, CodingKey {
            case screen
        }
        
        func getMoreInfo() -> [(title: String, fund: Double, CDI: Double)] {
            var moreInfo = [(String, Double, Double)]()
            
            let monthInfo = ("No mês", screen.moreInfo.month.fund, screen.moreInfo.month.CDI)
            let yearInfo = ("No Ano", screen.moreInfo.year.fund, screen.moreInfo.year.CDI)
            let twelveMonthsInfo = ("12 meses", screen.moreInfo.twelveMonths.fund, screen.moreInfo.twelveMonths.CDI)
            
            moreInfo.append(monthInfo)
            moreInfo.append(yearInfo)
            moreInfo.append(twelveMonthsInfo)
            
            return moreInfo
        }
        
        func getInfos() -> [(name: String, data: String?)] {
            var infos = [(String, String?)]()
            
            for info in screen.info {
                infos.append((info.name, info.data))
            }
            
            for info in screen.downInfo {
                infos.append((info.name, info.data))
            }
            
            return infos
        }
    }
    
    struct Funds: Codable {
        let title: String
        let fundName: String
        let whatIs: String
        let definition: String
        let riskTitle: String
        let risk: Int
        let infoTitle: String
        let moreInfo: MoreInfo
        let info: [Info]
        let downInfo: [Info]
        
        enum CodingKeys: String, CodingKey {
            case title
            case fundName
            case whatIs
            case definition
            case riskTitle
            case risk
            case infoTitle
            case moreInfo
            case info
            case downInfo
        }
    }
    
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
        
        enum CodingKeys: String, CodingKey {
            case fund
            case CDI
        }
    }
    
    struct Info: Codable {
        let name: String
        var data: String?
        
        enum CodingKeys: String, CodingKey {
            case name
            case data
        }
    }
}

