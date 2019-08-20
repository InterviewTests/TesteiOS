//
//  FieldType.swift
//  Domain
//
//  Created by Erika de Almeida Segatto on 03/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation

public enum FieldType: Int {
    case text = 1
    case telNumber = 2
    case email = 3
    
    static func get(_ type: String) -> FieldType? {
        if let intType = type.asInt() {
            return FieldType(rawValue: intType)
        }
        if type.uppercased() == "TEXT" {
            return .text
        }
        if type.uppercased() == "TELNUMBER" {
            return .telNumber
        }
        if type.uppercased() == "EMAIL" {
            return .email
        }
        return .text
    }
}
