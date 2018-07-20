//
//  Screen.swift
//  FinForm
//
//  Created by Gustavo on 20/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

struct Screen:Codable,Equatable {
    
    var title: String
    var fundName: String
    var whatIs: String
    var definition: String
    var riskTitle: String
    var risk: Int
    var infoTitle: String
    
    var moreInfo:[ScreenMoreInfo]
    var info:[ScreenInfo]
    var downInfo:[ScreenInfo]
    
}

// MARK: - Support Models

struct ScreenInfo:Codable,Equatable
{
    var name:String?
    var data:String?
}

struct ScreenMoreInfo:Codable,Equatable
{
    var fund:Float?
    var CDI:Float?
}

// MARK: - Parse Screen model
struct RootScreen:Codable,Equatable
{
    var screen:Screen
}

// MARK: - Parse ScreenMoreInfo model
struct RootScreenMoreInfo:Codable,Equatable
{
    var month:ScreenMoreInfo
    var year:ScreenMoreInfo
    var twelveMonths:ScreenMoreInfo
    
    enum CodingKeys: String, CodingKey {
        case month
        case year
        case twelveMonths = "12months"
    }
}

