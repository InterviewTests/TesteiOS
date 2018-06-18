//
//  Extensions.swift
//  TesteIOS
//
//  Created by Sidney Silva on 14/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

extension String{
    func getOnlyDigits() -> String{
        let strings = self.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
        let digitOnlyString = strings.joined(separator: "")
        return digitOnlyString
    }
}

extension UITextField {
    func fieldValidate(typeField: TypeField) -> Bool {
        switch typeField {
        case .text:
            if self.text != "" {
                return true
            }
            return false
        case .email:
            if self.text != "" {
                return ValidateUtil.validate(string: self.text!, pattern: Patterns.mailRegex)
            }
            return false
        case .telNumber:
            if self.text != "" {
                return ValidateUtil.validate(string: self.text!, pattern: Patterns.phoneRegex)
            }
            return false
        case .null:
            return false
        }
    }
}
