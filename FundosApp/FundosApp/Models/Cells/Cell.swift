//
//  Cell.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 08/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import Foundation
enum Type: Int,Codable {
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
    
}

struct Cell:Codable{
    
    var id: Int
    var type: Type
    var message: String
    var typeField: TypeField?
    var hidden: Bool
    var topSpacing: Float
    var show: Int?
    var required: Bool
}
