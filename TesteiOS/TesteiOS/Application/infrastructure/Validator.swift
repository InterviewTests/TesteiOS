//
//  Validator.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 08/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation

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
        let str = str.onlyDigits
        let regex = try! NSRegularExpression(pattern: "^[0-9]{10,11}$", options: .caseInsensitive)
        return regex.firstMatch(in: str, options: [], range: NSRange(location: 0, length: str.count)) != nil
    }
    
    func format(phoneNumber: String, shouldRemoveLastDigit: Bool = false) -> String {
        guard !phoneNumber.isEmpty else { return "" }
        guard let regex = try? NSRegularExpression(pattern: "[\\s-\\(\\)]", options: .caseInsensitive) else { return "" }
        let r = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regex.stringByReplacingMatches(in: phoneNumber, options: .init(rawValue: 0), range: r, withTemplate: "")
        
        if number.count > 11 {
            let tenthDigitIndex = number.index(number.startIndex, offsetBy: 11)
            number = String(number[number.startIndex..<tenthDigitIndex])
        }
        
        if shouldRemoveLastDigit {
            let end = number.index(number.startIndex, offsetBy: number.count-1)
            number = String(number[number.startIndex..<end])
        }
        
        if number.count < 7 {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{2})(\\d+)", with: "($1) $2", options: .regularExpression, range: range)
            
        } else {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            if number.count == 10 {
                number = number.replacingOccurrences(of: "(\\d{2})(\\d{4})(\\d+)", with: "($1) $2-$3", options: .regularExpression, range: range)
            }else{
                number = number.replacingOccurrences(of: "(\\d{2})(\\d{5})(\\d+)", with: "($1) $2-$3", options: .regularExpression, range: range)
            }
        }
        
        return number
    }
}
