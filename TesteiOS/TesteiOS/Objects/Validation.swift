//
//  Validation.swift
//  TesteiOS
//
//  Created by Carolina Bonturi on 7/1/18.
//  Reference github.com/SandeepSpider811
//  Copyright © 2018 Carolina Bonturi. All rights reserved.
//

import Foundation


enum Valid : Int {
    case success = 1
    case failure = 0
}

enum ValidationType : Int {
    case name = 1
    case email = 2
    case phoneNumber = 3
}

enum RegEx: String {
    case alphaChar = "[A-Za-z]+" // Only alphabetic charactres
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]+"
    case phoneNumber = "\\([0-9]{2}\\)\\s[0-9]{4,5}-[0-9]{4}" // Phone Number formatted
}


class Validation: NSObject {
    
    public static let shared = Validation()
    
    func validate(type: ValidationType, inputValue: String) -> Valid {
        
            switch type {
            case .name:
                if let tempValue = isValidString(input: inputValue, regex: .alphaChar) {
                    return tempValue
                }
            case .phoneNumber:
                if let tempValue = isValidString(input: inputValue, regex: .phoneNumber) {
                    return tempValue
                }
            case .email:
                if let tempValue = isValidString(input: inputValue, regex: .email) {
                    return tempValue
                }
            }
    
        return Valid.success
    }

    
    // test if the input is valid according to regex rule
    private func isValidString(input: String, regex: RegEx) -> Valid? {
        if input.isEmpty {
            return Valid.failure
        } else if !isValidRegEx(input, regex) {
            return Valid.failure
        }
        return nil
    }
    
    
    // test if the input is compliant
    private func isValidRegEx(_ testStr: String, _ regex: RegEx) -> Bool {
        let stringTest = NSPredicate(format:"SELF MATCHES %@", regex.rawValue)
        let result = stringTest.evaluate(with: testStr)
        return result
    }
}

