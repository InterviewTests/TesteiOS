//
//  Validators.swift
//  Investimentos
//
//  Created by Cmdev on 12/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

class Validators: NSObject {
    static func isValidEmail(testStr: String) -> Bool {
        //expressão regular para validar e-mail
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
