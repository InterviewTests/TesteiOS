//
//  Cell.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/7/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import Foundation

struct CellList: Codable {
    var cells: [Cell]
}

struct Cell: Equatable, Codable {
    enum CellType: Int {
        case field = 1
        case text = 2
        case image = 3
        case checkbox = 4
        case button = 5
    }
    
    enum FieldType: Int {
        case text = 1
        case phoneNumber = 2
        case email = 3
    }
    
    // Cell properties
    var id: Int
    var type: Int // CellType
    var message: String
    var typefield: Int? // FieldType?
    var hidden: Bool
    var topSpacing: Double
    var show: Int?
    var required: Bool
}

func ==(lhs: Cell, rhs: Cell) -> Bool {
    return lhs.id == rhs.id
}
