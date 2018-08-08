//
//  StringValidator.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 05/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

protocol StringValidator {
    func validate(text: String) -> Bool
}

struct StringEmailValidator: StringValidator {
    func validate(text: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: text)
    }
}

struct StringTelValidator: StringValidator {
    func validate(text: String) -> Bool {
        return text.count >= 14
    }
}
