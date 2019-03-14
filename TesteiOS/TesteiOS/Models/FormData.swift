//
//  FormData.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 22/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation

struct FormData {
  let cells: [Cell]
}

extension FormData: Decodable {
  private enum CodingKeys: String, CodingKey {
    case cells
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    cells = try container.decode([Cell].self, forKey: .cells)
  }
}
