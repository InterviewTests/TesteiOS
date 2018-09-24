//
//  ScreenInfo.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import Foundation


struct Screen : Codable {
    var title       : String?
    var fundName    : String?
    var whatIs      : String?
    var definition  : String?
    var riskTitle   : String?
    var risk        : Int = 0
    var infoTitle   : String?
    var moreInfo    : ScreenMoreInfo?
    var infos       : [FundInfo]     = []
    var downInfos   : [FundDownInfo] = []
    var allFunds    : [Fundable]     = []
    
    private enum CodingKeys : String, CodingKey {
        case title      = "title"
        case fundName   = "fundName"
        case whatIs     = "whatIs"
        case definition = "definition"
        case riskTitle  = "riskTitle"
        case risk       = "risk"
        case infoTitle  = "infoTitle"
        case moreInfo   = "moreInfo"
        case infos      = "info"
        case downInfos  = "downInfo"
    }
    
    init() {}
    
    init(from decoder : Decoder)throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title       = try? container.decode(String.self, forKey: .title)
        fundName    = try? container.decode(String.self, forKey: .fundName)
        whatIs      = try? container.decode(String.self, forKey: .whatIs)
        definition  = try? container.decode(String.self, forKey: .riskTitle)
        riskTitle   = try? container.decode(String.self, forKey: .riskTitle)
        risk        = try container.decode(Int.self, forKey: .risk)
        infoTitle   = try? container.decode(String.self, forKey: .infoTitle)
        moreInfo    = try? container.decode(ScreenMoreInfo.self, forKey: .moreInfo)
        infos       = try container.decode([FundInfo].self, forKey: .infos)
        downInfos   = try container.decode([FundDownInfo].self, forKey: .downInfos)
        
        infos.forEach     { allFunds.append($0) }
        downInfos.forEach { allFunds.append($0) }
    }
}
