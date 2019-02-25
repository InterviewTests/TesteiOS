//
//  MoreInfoData.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 23/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation

struct MoreInfoData {
  let month: MoreInfo
  let year: MoreInfo
  let twelveMonths: MoreInfo
}

extension MoreInfoData: Decodable {
  private enum CodingKeys: String, CodingKey {
    case month
    case year
    case twelveMonths = "12months"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    month = try container.decode(MoreInfo.self, forKey: .month)
    year = try container.decode(MoreInfo.self, forKey: .year)
    twelveMonths = try container.decode(MoreInfo.self, forKey: .twelveMonths)
  }
}
