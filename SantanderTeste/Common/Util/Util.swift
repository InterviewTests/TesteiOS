//
//  Util.swift
//  CheckinCheckout
//
//  Created by Rafael Macito on 16/02/2018.
//  Copyright © 2018 Madeinweb. All rights reserved.
//

import Foundation

class Util: NSObject {
    static func validate(_ cpf: String) -> Bool {
        let cleanCpf = String(cpf.filter { "01234567890".contains($0) }) as String
        guard cleanCpf.count == 11 else { return false }
        
        let firstValidation: [Int] = String(cleanCpf.prefix(9)).map({ Int(String($0)) ?? 0 })
        let secondValidation: [Int] = String(cleanCpf.prefix(10)).map({ Int(String($0)) ?? 0 })
        
        let firstDigit = Int(String(cleanCpf[cleanCpf.index(cleanCpf.startIndex, offsetBy: 9)])) ?? 0
        let secondDigit = Int(String(cleanCpf[cleanCpf.index(cleanCpf.startIndex, offsetBy: 10)])) ?? 0
        
        guard validate(firstValidation, digit: firstDigit), validate(secondValidation, digit: secondDigit) else { return false }
        
        return true
    }
    
    private static func validate(_ validation: [Int], digit: Int) -> Bool {
        var sum = 0
        for index in validation.indices {
            guard let indexInt = Int(String(describing: index)) else { return false }
            let number = validation[index]
            let mult = (validation.count + 1) - indexInt
            
            sum += number * mult
        }
        
        var resto = (sum * 10) % 11
        if resto == 10 { resto = 0 }
        
        if resto != digit { return false }
        
        return true
    }
}
