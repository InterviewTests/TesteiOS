//
//  String.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 14/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
