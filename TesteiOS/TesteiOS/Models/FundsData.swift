//
//  FundsData.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 22/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation

struct FundsData {
  let fund: Fund
}

extension FundsData: Decodable {
  private enum CodingKeys: String, CodingKey {
    case fund = "screen"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    fund = try container.decode(Fund.self, forKey: .fund)
  }
}
