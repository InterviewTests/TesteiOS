//
//  MaskUtil.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 13/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import UIKit

class MaskUtil {
  
  class func formattedNumber(with mask: String, and number: String) -> String {
    let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    
    var result = ""
    var index = cleanPhoneNumber.startIndex
    for char in mask {
      if index == cleanPhoneNumber.endIndex {
        break
      }
      if char == "X" {
        result.append(cleanPhoneNumber[index])
        index = cleanPhoneNumber.index(after: index)
      } else {
        result.append(char)
      }
    }
    return result
  }
  
  class func unmask(_ value: String) -> String {
    var unmasked:String = ""
    
    for index in 0..<value.count {
      let char = value[value.index(value.startIndex, offsetBy: index)]
      
      if let number = Int(String(char)) {
        unmasked = unmasked + "\(number)"
      }
    }
    
    return unmasked
  }

}
