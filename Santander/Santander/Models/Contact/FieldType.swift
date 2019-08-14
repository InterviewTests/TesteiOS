//
//  FieldType.swift
//  Santander
//
//  Created by Orlando Amorim on 12/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import Foundation

enum FieldType: Int, Decodable {
    case text = 1
    case phone = 2
    case email = 3
    
    enum FieldTypeError: Error {
        case decoding(String)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let typeInt = try? container.decode(Int.self), let type = FieldType(rawValue: typeInt) {
            self = type
            return
        }
        
        if let typeString = try? container.decode(String.self), let type = try? FieldType(type: typeString) {
            self = type
            return
        }
        
        throw FieldTypeError.decoding("The value \(container.codingPath) does not match with any type")
    }
    
    var tag: String {
        switch self {
        case .text:
            return "text"
        case .phone:
            return "phone"
        case .email:
            return "email"
        }
    }
}

extension FieldType {
    init(type: String) throws {
        switch type {
        case "telnumber":
            self = .phone
        default:
            throw FieldTypeError.decoding("The value \(type) does not match with any type")
        }
    }
}
