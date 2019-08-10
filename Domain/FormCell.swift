//
//  FormCell.swift
//  Domain
//
//  Created by Erika de Almeida Segatto on 03/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation


public struct FormCell {
    public var id: Int
    public var cellType: String
    public var fieldType: String
    public var message: String
    public var topSpacing: Double
    public var show: Int
    public var hidden: Bool
    public var required: Bool

    public init(id: Int, cellType: String, fieldType: String, message: String, topSpacing: Double, show: Int, hidden: Bool, required: Bool) {
        self.id = id
        self.cellType = cellType
        self.fieldType = fieldType
        self.message = message
        self.topSpacing = topSpacing
        self.show = show
        self.hidden = hidden
        self.required = required
    }
}
//Enum Type {
//    case field = 1,
//    case text = 2,
//    case image = 3,
//    case checkbox = 4,
//    case send = 5
//}
//Enum TypeField {
//    case text = 1,
//    case telNumber = 2,
//    case email = 3
//}
