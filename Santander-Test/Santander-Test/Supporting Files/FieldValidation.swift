//
//  FieldValidation.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 15/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import Foundation

class FieldValidation {
    
    static func isValid(text: String) -> Bool {
        return !text.isEmpty
    }
    
    static func isValid(phoneNumber: String) -> Bool {
        let phoneNumberPredicate = NSPredicate(format: "SELF MATCHES %@", "^\\([1-9]{2}\\) (?:[2-8]|9[1-9])[0-9]{3}\\-[0-9]{4}$")
        let isPhoneNumber = phoneNumberPredicate.evaluate(with: phoneNumber)
        return isPhoneNumber
    }
    
    static func isValid(email: String) -> Bool {
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        let isEmail = emailPredicate.evaluate(with: email)
        
        return isEmail
    }
    
}
