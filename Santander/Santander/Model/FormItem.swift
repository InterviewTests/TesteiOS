//
//  FormItem.swift
//  Santander
//
//  Created by Jonathan Martins on 05/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import Foundation

enum Type:Int,Decodable {
    case unknown = 0
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
}

enum TypeField:Int,Decodable {
    case unknown = 0
    case text = 1
    case telNumber = 2
    case email = 3
}

struct Root:Decodable {
    
    var cells:[FormItem]?

    private enum CodingKeys: String, CodingKey {
        case cells = "cells"
    }
}

class FormItem: Decodable {
    
    var id:Int?
    var type:Type = .unknown
    var message:String?
    var typefield:TypeField = .unknown
    var hidden:Bool = false
    var topSpacing:Int?
    var show:Int?
    var required:Bool = false
    var dataText:String?
    var isSuccess:Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case id         = "id"
        case type       = "type"
        case message    = "message"
        case typefield  = "typefield"
        case hidden     = "hidden"
        case topSpacing = "topSpacing"
        case show       = "show"
        case required   = "required"
    }
    
    required init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id           = try container.decodeIfPresent(Int.self      , forKey: .id)
        self.type         = try container.decodeIfPresent(Type.self     , forKey: .type)      ?? .unknown
        self.message      = try container.decodeIfPresent(String.self   , forKey: .message)
        if let value = try? container.decode(TypeField.self, forKey: .typefield) {
            self.typefield = TypeField(rawValue: value.rawValue) ?? .telNumber
        }
        else{
            self.typefield = .telNumber
        }
        self.hidden       = try container.decodeIfPresent(Bool.self     , forKey: .hidden)    ?? false
        self.topSpacing   = try container.decodeIfPresent(Int.self      , forKey: .topSpacing)
        self.show         = try container.decodeIfPresent(Int.self      , forKey: .show)
        self.required     = try container.decodeIfPresent(Bool.self     , forKey: .required)  ?? false
    }
}
