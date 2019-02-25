//
//  Fund.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 23/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation

struct Fund {
  let title: String
  let fundName: String
  let whatIs: String
  let definition: String
  let riskTitle: String
  let risk: Int
  let infoTitle: String
  let moreInfo: MoreInfoData
  let info: [Info]
  let downInfo: [Info]
}

extension Fund: Decodable {
  private enum CodingKeys: String, CodingKey {
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
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    title = try container.decode(String.self, forKey: .title)
    fundName = try container.decode(String.self, forKey: .fundName)
    whatIs = try container.decode(String.self, forKey: .whatIs)
    definition = try container.decode(String.self, forKey: .definition)
    riskTitle = try container.decode(String.self, forKey: .riskTitle)
    risk = try container.decode(Int.self, forKey: .risk)
    infoTitle = try container.decode(String.self, forKey: .infoTitle)
    moreInfo = try container.decode(MoreInfoData.self, forKey: .moreInfo)
    info = try container.decode([Info].self, forKey: .info)
    downInfo = try container.decode([Info].self, forKey: .downInfo)
  }
}
