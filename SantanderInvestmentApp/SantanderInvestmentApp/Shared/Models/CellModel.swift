//
//  CellModel.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 18/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation
enum CellType: Int, Codable {
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
}

enum TypeField: Int, Codable {
    case text = 1
    case telNumber = 2
    case email = 3
}

struct CellsModel: Codable {
    var cells: [CellModel]
}

struct CellModel: Codable {
    var id: Int
    var type: CellType
    var message: String
    var typefield: TypeField?
    var hidden: Bool
    var topSpacing: Float
    var show: Int?
    var required: Bool
    
    // There is a error on API Answer, this init is being used only to work around the error.
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        type = try values.decode(CellType.self, forKey: .type)
        message = try values.decode(String.self, forKey: .message)
        if let type = try? values.decode(TypeField?.self, forKey: .typefield) {
            typefield = type
        } else {
            typefield = TypeField.telNumber
        }
        hidden = try values.decode(Bool.self, forKey: .hidden)
        topSpacing = try values.decode(Float.self, forKey: .topSpacing)
        show = try values.decode(Int?.self, forKey: .show)
        required = try values.decode(Bool.self, forKey: .required)
    }
    
    init(id: Int, type: CellType, message: String, typefield: TypeField?, hidden: Bool, topSpacing: Float, show: Int?, required: Bool) {
        self.id = id
        self.type = type
        self.message = message
        self.typefield = typefield
        self.hidden = hidden
        self.topSpacing = topSpacing
        self.show = show
        self.required = required
    }
}
