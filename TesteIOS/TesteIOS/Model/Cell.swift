//
//  Cell.swift
//  TesteIOS
//
//  Created by Sidney Silva on 03/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

struct CellRoot: Codable {
    var cells: [Cell]
}

struct Cell: Codable {
    var id: Int?
    var type: Int?
    var message: String?
    var typefield: AnyType<Int, String>
    var hidden: Bool?
    var topSpacing: Double?
    var show: Int?
    var required: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case message = "message"
        case typefield = "typefield"
        case hidden = "hidden"
        case topSpacing = "topSpacing"
        case show = "show"
        case required = "required"
    }
}

