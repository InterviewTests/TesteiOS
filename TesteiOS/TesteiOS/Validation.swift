//
//  Validation.swift
//  TesteiOS
//
//  Created by Carolina Bonturi on 7/1/18.
//  Reference https://github.com/SandeepSpider811
//  Copyright © 2018 Carolina Bonturi. All rights reserved.
//

import Foundation


enum Alert {
    case success
    case failure
    case error
}

enum Valid {
    case success
    case failure(Alert, AlertMessages)
}

enum ValidationType {
    case name
    case phoneNumber
    case email
}

enum RegEx: String {
    case alphaChar = "[A-Za-z]+" // Only alphabetic charactres
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]+"
    case phoneNumber = "\\([0-9]{2}\\)\\s[0-9]{4,5}-[0-9]{4}" // Phone Number formatted
}

enum AlertMessages: String {
    case invalidEmail = "Este e-mail não é válido"
    case invalidPhone = "Este telefone não é válido"
    case invalidAlphabeticString = "Este nome não é válido"
    case empty = "Este campo deve ser preenchido"
    
    func localized() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}



class Validation: NSObject {
    
    public static let shared = Validation()
    
    func validate(values: (type: ValidationType, inputValue: String)...) -> Valid {
        for valueToBeChecked in values {
            switch valueToBeChecked.type {
            
            case .name:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .alphaChar, .empty, .invalidAlphabeticString)) {
                    return tempValue
                }
                
            case .phoneNumber:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .phoneNumber, .empty, .invalidPhone)) {
                    return tempValue
                }
                
            case .email:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .email, .empty, .invalidEmail)) {
                    return tempValue
                }
            }
        }
        
        return .success
    }
    
    
    // test if the input has data
    func isValidString(_ input: (text: String, regex: RegEx, emptyAlert: AlertMessages, invalidAlert: AlertMessages)) -> Valid? {
        if input.text.isEmpty {
            return .failure(.error, input.emptyAlert)
        } else if isValidRegEx(input.text, input.regex) != true {
            // TODO!
            return .failure(.error, input.invalidAlert)
        }
        return nil
    }
    
    
    // test if the input is compliant
    func isValidRegEx(_ testStr: String, _ regex: RegEx) -> Bool {
        let stringTest = NSPredicate(format:"SELF MATCHES %@", regex.rawValue)
        let result = stringTest.evaluate(with: testStr)
        return result
    }
}

