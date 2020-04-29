//
//  ContactModel.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 28/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation

// MARK: - ContactModel
class ContactModel: Codable {
    let cells: [CellForm]
    
    init(cells: [CellForm]) {
        self.cells = cells
    }
}

// MARK: - Cell
class CellForm: Codable {
    let id, type: Int
    let message: String
    let typefield: TypefieldDataType
    let hidden: Bool
    let topSpacing: Int
    let show: Int?
    let cellRequired: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, type, message, typefield, hidden, topSpacing, show
        case cellRequired = "required"
    }
    
    init(id: Int, type: Int, message: String, typefield: TypefieldDataType, hidden: Bool, topSpacing: Int, show: Int?, cellRequired: Bool) {
        self.id = id
        self.type = type
        self.message = message
        self.typefield = typefield
        self.hidden = hidden
        self.topSpacing = topSpacing
        self.show = show
        self.cellRequired = cellRequired
    }
    
    func getCellType() -> ComponentTypeEnum {
        return ComponentTypeEnum(rawValue: type) ?? ComponentTypeEnum.none
    }
    
    func getCellTypeField() -> TypeFieldEnum {
        switch typefield {
        case .integer(1):
            return .text
        case .string("telnumber"):
            return .telNumber
        case .integer(3):
            return .email
        default:
            return .none
        }
    }
}

enum TypefieldDataType: Codable {
    case integer(Int)
    case string(String)
    case null
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let number = try? container.decode(Int.self) {
            self = .integer(number)
            return
        }
        if let text = try? container.decode(String.self) {
            self = .string(text)
            return
        }
        if container.decodeNil() {
            self = .null
            return
        }
        
        throw DecodingError.typeMismatch(TypefieldDataType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Typefield"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        case .null:
            try container.encodeNil()
        }
    }
}

