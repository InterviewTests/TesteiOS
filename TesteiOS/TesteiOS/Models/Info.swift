//
//  Info.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 23/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation

struct Info {
  let name: String
  let data: String?
}

extension Info: Decodable {
  private enum CodingKeys: String, CodingKey {
    case name
    case data
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decode(String.self, forKey: .name)
    data = try? container.decode(String.self, forKey: .data)
  }
}


