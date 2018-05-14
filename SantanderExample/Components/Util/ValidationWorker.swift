//
//  ValidationWorker.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 13/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import UIKit

class ValidationWorker: NSObject {
  
  public static func validate(email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: email)
  }
  
  public static func validate(phoneNumber: String) -> Bool {
    let unmaskPhone = MaskUtil.unmask(phoneNumber)
    
    return unmaskPhone.count == 11
  }
}
