//
//  Cell.swift
//  FinForm
//
//  Created by Gustavo on 20/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

import Foundation

struct Cell: Codable
{
    var id: Int?
    var type: Type?
    var message: String?
    var typeField: TypeField?
    var topSpacing: Float?
    var show: Int?
    var required: Bool?
}

enum Type: Int,Codable{
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
}

enum TypeField: Int,Codable{
    case text = 1
    case telNumber = 2
    case email = 3
}

// MARK: - Parse cells model
struct RootCells:Codable
{
    var cells:[Cell]
}
