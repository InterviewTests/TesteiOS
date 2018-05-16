//
//  ContactFormItem.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import Foundation

enum Type: Int, Decodable {
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
}

enum TypeField: Int, Decodable {
    case text = 1
    case telNumber = 2
    case email = 3
}

struct ContactFormItem: Decodable {
    
    var id: Int?
    var type: Type?
    var message: String?
    var typefield: TypeField?
    var hidden: Bool = false
    var topSpacing: Double?
    var show: Int?
    var required = false
    
    var textValue: String = ""
    var checkboxValue: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case message
        case typefield
        case hidden
        case topSpacing
        case show
        case required
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try? values.decode(Int.self, forKey: .id)
        type = try? values.decode(Type.self, forKey: .type)
        message = try? values.decode(String.self, forKey: .message)
        typefield = try? values.decode(TypeField.self, forKey: .typefield)
        hidden = (try? values.decode(Bool.self, forKey: .hidden)) ?? false
        topSpacing = try? values.decode(Double.self, forKey: .topSpacing)
        show = try? values.decode(Int.self, forKey: .show)
        required = (try? values.decode(Bool.self, forKey: .required)) ?? false
    }
}
