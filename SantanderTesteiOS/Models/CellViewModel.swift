//
//  CellViewModel.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 23/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import Foundation

enum CellType : Int {
    case unknown    = 0
    case field      = 1
    case text       = 2
    case image      = 3
    case checkbox   = 4
    case send       = 5
}

enum TypeField : Int {
    case unknown    = 0
    case text       = 1
    case telNumber  = 2
    case email      = 3
}

struct CellViewModel {
    var id          : Int       = 0
    var type        : CellType  = .field
    var message     : String    = ""
    var typeField   : TypeField = .text
    var isHidden    : Bool      = false
    var topSpacing  : Double    = 8.0
    var show        : Int       = 0
    var isRequired  : Bool      = false
    
    var cell : Cell
    
    init(cell : Cell) {
        self.cell = cell
        self.transformToViewModel()
    }
    
    private mutating func transformToViewModel() {
        id          = cell.id ?? 0
        type        = CellType(rawValue: cell.type ?? -1) ?? .unknown
        message     = cell.message ?? ""
        typeField   = TypeField(rawValue: cell.typeField ?? 0) ?? .unknown
        isHidden    = cell.hidden ?? false
        topSpacing  = cell.topSpacing ?? 0.0
        show        = cell.show ?? 0
        isRequired  = cell.required ?? false
    }
}
