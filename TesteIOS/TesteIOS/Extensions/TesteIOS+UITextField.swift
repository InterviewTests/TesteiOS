//
//  TesteIOS+UITextField.swift
//  TesteIOS
//
//  Created by Sidney Silva on 14/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

extension UITextField {
    func fieldValidate(cell: Cell) -> Bool {
        switch cell.typefield! {
        case .text:
            if self.text != nil && self.text != "" {
                return true
            }
            return false
        case .email:
            if self.text != nil {
                return ValidateUtil.validate(string: self.text!, pattern: Patterns.mailRegex)
            }
            return false
        case .telNumber:
            if self.text != nil {
                return ValidateUtil.validate(string: self.text!, pattern: Patterns.phoneRegex)
            }
            return false
        default:
            return false
        }
    }
}
