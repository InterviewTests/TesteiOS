//
//  CellType.swift
//  Santander
//
//  Created by Orlando Amorim on 12/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import Foundation

enum FormCellType: Int, Decodable {
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
}
