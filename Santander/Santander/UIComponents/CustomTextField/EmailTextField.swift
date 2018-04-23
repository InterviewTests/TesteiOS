//
//  EmailTextField.swift
//  Santander
//
//  Created by Gabriel vieira on 4/22/18.
//  Copyright © 2018 Gabriel vieira. All rights reserved.
//

import UIKit

class EmailTextField: CustomTextField {
    
    override func config() {
        super.config()
        self.textField.keyboardType = .emailAddress
    }
    
    override func validateField() {
        
        if self.textField.text == "" {
            self.setStatusBarColor(Color.gray)
        } else {
            self.fieldIsValid = self.isValidEmail(testStr: self.textField.text!)
            if self.fieldIsValid {
                self.setStatusBarColor(Color.riskLightGreen)
            } else {
                self.setStatusBarColor(Color.lineRed)
            }
        }
        
        self.delegate?.validationChanged()
    }
    
    private func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
