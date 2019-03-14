//
//  MoreInfo.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 23/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation

struct MoreInfo {
  let fund: Double
  let cdi: Double
}

extension MoreInfo: Decodable {
  private enum CodingKeys: String, CodingKey {
    case fund
    case cdi = "CDI"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    fund = try container.decode(Double.self, forKey: .fund)
    cdi = try container.decode(Double.self, forKey: .cdi)
  }
}
