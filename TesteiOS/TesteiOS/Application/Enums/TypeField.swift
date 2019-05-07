//
//  TypeField.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 06/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation

enum TypeField:Int {
    case text = 1
    case telNumber = 2
    case email = 3
    case null = 4
    
    static func fromString(_ str: String) -> TypeField {
        switch str.lowercased() {
        case "text":
            return self.text
        case "telnumber":
            return self.telNumber
        case "email":
            return self.email
        case "":
            return self.null
        default:
            return self.text
        }
    }
    
    var titleField:String {
        switch self {
        case .telNumber:
            return "Telefone"
        case .email:
            return "Email"
        default:
            return "Nome completo"
        }
    }
}
