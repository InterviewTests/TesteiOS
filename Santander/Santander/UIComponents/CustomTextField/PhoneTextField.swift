//
//  PhoneTextField.swift
//  Santander
//
//  Created by Gabriel vieira on 4/22/18.
//  Copyright © 2018 Gabriel vieira. All rights reserved.
//

import UIKit

class PhoneTextField: CustomTextField {
    
    override func config() {
        super.config()
        self.textField.keyboardType = .phonePad
        self.textField.maskString = "(00) 0000-0000"
        self.textField.delegate = self
    }
    
    func validateField(text: String) {
        
        if self.textField.text == "" {
            self.setStatusBarColor(Color.gray)
        } else {
            self.fieldIsValid = text.count >= 14
            if self.fieldIsValid {
                self.setStatusBarColor(Color.riskLightGreen)
            } else {
                self.setStatusBarColor(Color.lineRed)
            }
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text as NSString? else { return true }
        let newText = text.replacingCharacters(in: range, with: string)
        self.validateField(text: newText)
        let maskTextField = textField as! JMMaskTextField
        guard let unmaskedText = maskTextField.stringMask?.unmask(string: newText) else { return true }
        
        if unmaskedText.count >= 11 {
            maskTextField.maskString = "(00) 00000-0000"
        } else {
            maskTextField.maskString = "(00) 0000-0000"
        }
        return true
    }
}
