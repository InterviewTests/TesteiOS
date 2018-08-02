//
//  RootScreen.swift
//  SantanderTeste
//
//  Created by Danilo Henrique on 20/07/2018.
//  Copyright © 2018 Nayara. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

struct Root: Decodable {
    var screen:Investimento!
}
struct Investimento: Decodable {
    let title: String!
    let fundName: String!
    let whatIs: String!
    let definition: String!
    let riskTitle: String!
    let risk: Int!
    let infoTitle:String!
    let moreInfo: Moreinf!
    let info: [Inf]!
    let downInfo: [DownInf]!
}
struct Moreinf: Decodable {
    let month:Fund!
    let year: Fund!
    let months: Fund!//12months
    
    private enum CodingKeys: String, CodingKey {
        case month = "month"
        case year = "year"
        case months = "12months"
        
    }
    
}
struct Inf: Decodable {
    
    let name: String!
    let data: String!
    
}
struct DownInf: Decodable {
    let name: String!
    let data: String?
}
struct Fund: Decodable {
    var fund: CGFloat!
    var CDI: CGFloat!
}

