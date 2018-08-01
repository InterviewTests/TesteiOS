//
//  Extensions.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//

import UIKit

extension String{
    func getOnlyDigits() -> String{
        let strings = self.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
        let digitOnlyString = strings.joined(separator: "")
        return digitOnlyString
    }
}


extension UIColor {
    class func colorFromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
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
