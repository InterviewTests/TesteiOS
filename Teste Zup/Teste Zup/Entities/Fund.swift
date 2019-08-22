//
//  Fund.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 22/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct Fund: Decodable {
    let screen: Screen
}

struct Screen: Decodable {
    let title: String?
//    let fundName: String
//    let whatIs: String
//    let definition: String
//    let riskTitle: String
//    let risk: Int
//    let infoTitle: String
//    let moreInfo: [MoreInfo]
//    let info: String
}

struct MoreInfo: Decodable {
    let month: Period?
    let year: Period?
    let twelveMonths: Period?
}

struct Period: Decodable {
    let fund: Int
    let CDI: Int
}


