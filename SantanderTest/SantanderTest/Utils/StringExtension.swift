//
//  StringExtension.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 30/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import Foundation

extension String
{
    var isValidEmail: Bool
    {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        return NSPredicate(format:"SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
    
    var isValidPhone: Bool
    {
//        let phoneRegex = "REGEX TELEFONE BR"
        
//        return NSPredicate(format:"SELF MATCHES %@", phoneRegex).evaluate(with: self)
        
        return true
    }
    
    func maskPhone(pattern: String, replacmentCharacter: Character) -> String
    {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        
        for index in 0 ..< pattern.count
        {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(encodedOffset: index)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacmentCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        
        return pureNumber
    }
}
