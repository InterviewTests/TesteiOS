//
//  Cell.swift
//  TesteiOS
//
//  Created by Nicolau on 14/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import Foundation

enum Type: Int, Decodable {
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
}

enum TypeField: Int, Decodable {
    case text = 1
    case telNumber = 2
    case email = 3
}

struct Cell: Decodable {
    let id: Int
    let type: Type
    let message: String
    let typefield: TypeField?
    let hidden: Bool
    let topSpacing: Float
    let show: Int?
    let required: Bool
}
