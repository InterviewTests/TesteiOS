//
//  Cell.swift
//  FinForm
//
//  Created by Gustavo on 20/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

import Foundation

struct Cell: Codable,Equatable
{
    var id: Int?
    var type: Type?
    var message: String?
    var typeField: TypeField?
    var hidden:Bool?
    var topSpacing: Float?
    var show: Int?
    var required: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case id,type,message,hidden,topSpacing,show,required
        
        case typeField = "typefield"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(Int.self, forKey: .id)
        type = try? container.decode(Type.self, forKey: .type)
        message = try? container.decode(String.self, forKey: .message)
        hidden = try? container.decode(Bool.self, forKey: .hidden)
        topSpacing = try? container.decode(Float.self, forKey: .topSpacing)
        show = try? container.decode(Int.self, forKey: .show)
        required = try? container.decode(Bool.self, forKey: .required)
        if let value = try? container.decode(Int.self, forKey: .typeField) {
            typeField = TypeField(rawValue: value)
        } else {
            let stringValue = try? container.decode(String.self, forKey: .typeField)
            if stringValue == "telnumber"{
                typeField = TypeField(rawValue: 2)
            } else{
                typeField = TypeField(rawValue: 0)
            }
        }
    }
}

enum Type: Int,Codable,Equatable{
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
}

enum TypeField: Int,Codable,Equatable{
    case none = 0
    case text = 1
    case telNumber = 2
    case email = 3
}

// MARK: - Parse cells model
struct RootCells:Codable,Equatable
{
    var cells:[Cell]
}
