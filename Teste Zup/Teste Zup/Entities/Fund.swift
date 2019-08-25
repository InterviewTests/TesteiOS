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
    let title: String
    let fundName: String
    let whatIs: String
    let definition: String
    let riskTitle: String
    let risk: Int
    let infoTitle: String
    let moreInfo: MoreInfo
    let info: [Info]
    let downInfo: [DownInfo]
}

struct MoreInfo: Decodable {
    let month: Period
    let year: Period
}

struct Period: Decodable {
    let fund: Double
    let CDI: Double
}

extension Screen {
    struct Info: Decodable {
        let name: String
        let data: String
    }
    struct DownInfo: Decodable {
        let name: String
        let data: String?
    }
}



