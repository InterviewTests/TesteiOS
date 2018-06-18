//
//  TextFieldUtils.swift
//  TesteIOS
//
//  Created by Sidney Silva on 15/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class TextFieldUtils: NSObject {
    static func textFieldKeyboardType(type: TypeField) -> UIKeyboardType {
        switch type {
        case .text:
            return .default
        case .email:
            return .emailAddress
        case .telNumber:
            return .numberPad
        case .null:
            return .default
        }
    }
}
