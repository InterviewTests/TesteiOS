//
//  Fund.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 14/09/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

struct Fund: Codable {
    
    let screen: Screen
    
    struct Screen: Codable {
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
        
        struct MoreInfo: Codable {
            let month: Details
            let year: Details
            let twelveMonths: Details
            
            enum CodingKeys: String, CodingKey {
                case month
                case year
                case twelveMonths = "12months"
            }
            
            struct Details: Codable {
                let fund: Double
                let cdi: Double
                
                enum CodingKeys: String, CodingKey {
                    case fund
                    case cdi = "CDI"
                }
            }
        }
        
        struct Info: Codable {
            let name: String
            let data: String?
        }
    }
    
}
