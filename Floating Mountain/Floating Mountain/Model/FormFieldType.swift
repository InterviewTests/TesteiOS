//
//  FormFieldType.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 14/09/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

enum FormFieldType: Int, Codable {
    case textField = 1
    case label
    case image
    case checkbox
    case send
    
    enum TextFieldType: Int, Codable {
        case text = 1
        case phoneNumber
        case email
    }
}
