//
//  TypeField.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 08/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import Foundation
enum TypeField: Int,Codable{
    case text = 1
    case telNumber = 2
    case email = 3
    case null = 4
    
//    static func fromString(_ str: String) -> TypeField {
//        switch str.lowercased() {
//        case "text":
//            return self.text
//        case "telnumber":
//            return self.telNumber
//        case "email":
//            return self.email
//        case "":
//            return self.null
//        default:
//            return self.text
//        }
//    }
//
//    var textContentType: UITextContentType{
//        switch self {
//        case .email:
//            return UITextContentType.emailAddress
//        case .telNumber:
//            return UITextContentType.telephoneNumber
//        default:
//            return UITextContentType.name
//        }
//    }
//
//    var keyboardType: UIKeyboardType{
//        switch self {
//        case .email:
//            return UIKeyboardType.emailAddress
//        case .telNumber:
//            return UIKeyboardType.phonePad
//        default:
//            return UIKeyboardType.alphabet
//        }
//    }
}
