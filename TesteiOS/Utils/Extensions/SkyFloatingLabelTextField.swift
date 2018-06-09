//
//  SkyFloatingLabelTextField.swift
//  TesteiOS
//
//  Created by Macbook on 09/06/2018.
//  Copyright © 2018 mcaserta. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

extension SkyFloatingLabelTextField {
    // Validar o campo
    func validateField(){
        switch self.keyboardType {
            case UIKeyboardType.alphabet:
                // Validar texto
                if (self.text?.count)! > 0 {
                    self.lineColor = UIColor(red: 101.0/255.0, green: 190.0/255.0, blue: 48.0/255.0, alpha: 1.0)
                } else {
                    self.lineColor = UIColor(red: 202.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                }
            case UIKeyboardType.emailAddress:
                // Validar email
                if General.isValidEmail(testStr: self.text!){
                    self.lineColor = UIColor(red: 101.0/255.0, green: 190.0/255.0, blue: 48.0/255.0, alpha: 1.0)
                } else {
                    self.lineColor = UIColor(red: 202.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                }
            case UIKeyboardType.phonePad:
                break
            default:
                break
        }
    }
}
