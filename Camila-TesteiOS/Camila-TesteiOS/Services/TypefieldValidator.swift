
//
//  TypefieldValidator.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 21/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit

class TypefieldValidator {
    fileprivate var typefield: TypeField
    
    init(_ typefield: TypeField?) {
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
            return validatePhonenumber(phone: str)
        case .text:
            return true
        default:
            return false
        }
    }
    
    fileprivate func validateEmail(email str: String) -> Bool{
        let regex = try! NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,30}", options: .caseInsensitive)
        return regex.firstMatch(in: str, options: [], range: NSRange(location: 0, length: str.count)) != nil
    }
    
    fileprivate func validatePhonenumber(phone str: String) -> Bool{
        let regex = try! NSRegularExpression(pattern: "^[0-9]{10,11}$", options: .caseInsensitive)
        return regex.firstMatch(in: str, options: [], range: NSRange(location: 0, length: str.count)) != nil
    }
}
