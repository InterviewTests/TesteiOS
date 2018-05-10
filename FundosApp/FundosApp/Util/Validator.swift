//
//  Validator.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 09/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import Foundation
extension String{
    func digitsOnly() -> String{
        let stringArray = self.components(
            separatedBy: NSCharacterSet.decimalDigits.inverted)
        let newString = stringArray.joined(separator: "")
        
        return newString
    }
}


class Validator {
     var typefield: TypeField
    
    init( typefield: TypeField?) {
        self.typefield = typefield ?? TypeField.text
    }
    
    func validate(_ str: String?) -> Bool{
        guard let str = str, !str.isEmpty else{
            return false
        }
        
        switch typefield {
        case .email:
            return validateEmail(email: str)
        case .telNumber:
            return validatePhone(phone: str)
        case .text:
            return true
        default:
            return false
        }
    }
    
     func validateEmail(email str: String) -> Bool{
        let regex = try! NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,30}", options: .caseInsensitive)
        return regex.firstMatch(in: str, options: [], range: NSRange(location: 0, length: str.count)) != nil
    }
    
     func validatePhone(phone str: String) -> Bool{
        let str = str.digitsOnly()
        let regex = try! NSRegularExpression(pattern: "^[0-9]{10,11}$", options: .caseInsensitive)
        return regex.firstMatch(in: str, options: [], range: NSRange(location: 0, length: str.count)) != nil
    }
}
