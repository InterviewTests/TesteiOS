//
//  Cell.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 23/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import Foundation

struct Cell : Codable, Equatable {
    var id          : Int?
    var type        : Int?
    var message     : String?
    var typeField   : Int?
    var hidden      : Bool?
    var topSpacing  : Double?
    var show        : Int?
    var required    : Bool?
    
    
    static func ==(lhs : Cell, rhs : Cell) -> Bool {
        return lhs.id == rhs.id && lhs.type == rhs.type
    }
    static func <(lhs : Cell, rhs : Cell) -> Bool {
        return lhs.id ?? 0 < rhs.id ?? 0 && lhs.type ?? 0 < rhs.type ?? 0
    }
}
