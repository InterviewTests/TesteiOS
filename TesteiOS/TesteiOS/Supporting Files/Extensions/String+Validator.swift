//
//  String+Validator.swift
//  TesteiOSv2
//
//  Created by Brendoon Ryos on 11/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation

extension String {
  var isValidCPF: Bool {
    
    let numbers = self.compactMap({Int(String($0))})
    guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
    let sum1 = 11 - ( numbers[0] * 10 +
      numbers[1] * 9 +
      numbers[2] * 8 +
      numbers[3] * 7 +
      numbers[4] * 6 +
      numbers[5] * 5 +
      numbers[6] * 4 +
      numbers[7] * 3 +
      numbers[8] * 2 ) % 11
    let dv1 = sum1 > 9 ? 0 : sum1
    let sum2 = 11 - ( numbers[0] * 11 +
      numbers[1] * 10 +
      numbers[2] * 9 +
      numbers[3] * 8 +
      numbers[4] * 7 +
      numbers[5] * 6 +
      numbers[6] * 5 +
      numbers[7] * 4 +
      numbers[8] * 3 +
      numbers[9] * 2 ) % 11
    let dv2 = sum2 > 9 ? 0 : sum2
    return dv1 == numbers[9] && dv2 == numbers[10]
  }
  
  var isValidEmail: Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: self)
  }
  
  func isValidPassword() -> Bool {
    let capitalLetterRegEx  = ".*[A-Z]+.*"
    let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
    if !texttest.evaluate(with: self) {
      return false
    }
  
    let specialCharacterRegEx  = ".*[!@#$%&*():_+=/?´~;{}*ºª|\\,(){}^\\[\\]\"]+.*"
    let texttest2 = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
    if !texttest2.evaluate(with: self) {
      return false
    }
    
    let alphanumericLetterRegEx  = ".*[0-9]+.*"
    let texttest3 = NSPredicate(format:"SELF MATCHES %@", alphanumericLetterRegEx)
    if !texttest3.evaluate(with: self) {
      return false
    }
    
    return true
  }
}
