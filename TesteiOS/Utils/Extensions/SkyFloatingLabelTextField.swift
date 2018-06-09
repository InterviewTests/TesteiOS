//
//  SkyFloatingLabelTextField.swift
//  TesteiOS
//
//  Created by Macbook on 09/06/2018.
//  Copyright © 2018 mcaserta. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import AKMaskField

extension SkyFloatingLabelTextField {
    // Cores
    private static let validColor = UIColor(red: 101.0/255.0, green: 190.0/255.0, blue: 48.0/255.0, alpha: 1.0)
    private static let invalidColor = UIColor(red: 202.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    
    // Validar o campo
    func validateField(){
        
        switch self.keyboardType {
            case UIKeyboardType.alphabet:
                // Validar texto
                if (self.text?.count)! > 0 {
                    self.lineColor = SkyFloatingLabelTextField.validColor
                    self.selectedLineColor = SkyFloatingLabelTextField.validColor
                } else {
                    self.lineColor = SkyFloatingLabelTextField.invalidColor
                    self.selectedLineColor = SkyFloatingLabelTextField.invalidColor
                }
            case UIKeyboardType.emailAddress:
                // Validar email
                if General.isValidEmail(testStr: self.text!){
                    self.selectedLineColor = SkyFloatingLabelTextField.validColor
                    self.lineColor = SkyFloatingLabelTextField.validColor
                } else {
                    self.selectedLineColor = SkyFloatingLabelTextField.invalidColor
                    self.lineColor = SkyFloatingLabelTextField.invalidColor
                }
            case UIKeyboardType.phonePad:
                // Aplicar a mascara de telefone
                maskPhone()
                break
            default:
                break
        }
    }
    
    func maskPhone(){
        // Mascara no campo
        let field = AKMaskField()
        let phoneNumber = General.removeSpecialCharsFromString(self.text!)
        
        if phoneNumber.count == 11 {
            field.maskExpression = "({dd}) {ddddd}-{dddd}"
            field.text = phoneNumber
            self.text = field.text
            
            self.selectedLineColor = SkyFloatingLabelTextField.validColor
            self.lineColor = SkyFloatingLabelTextField.validColor
        } else if phoneNumber.count == 10 {
            field.maskExpression = "({dd}) {dddd}-{dddd}"
            field.text = phoneNumber
            self.text = field.text
            
            self.selectedLineColor = SkyFloatingLabelTextField.validColor
            self.lineColor = SkyFloatingLabelTextField.validColor
        } else {
            self.selectedLineColor = SkyFloatingLabelTextField.invalidColor
            self.lineColor = SkyFloatingLabelTextField.invalidColor
            return
        }
    }
}
