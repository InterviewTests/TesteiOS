//
//  LabelExtensions.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 30/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField

extension SkyFloatingLabelTextField: UITextFieldDelegate {
    
    
    func layoutTextField(configText:String) {
        let lightGreyColor = UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1.0)
        self.errorColor = UIColor.red
        self.selectedTitleColor = lightGreyColor
        self.delegate = self
        self.placeholder = configText
        self.accessibilityLabel = self.placeholder
        let customFont  = UIFont.init(name:"Helvetica-regular", size: 18)
        self.font = customFont
        self.title = self.placeholder
    }
    

    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = self.text {
            
            switch self.accessibilityLabel {
            case "Nome Completo"?:
                if(text.count + string.count == 0) {
                    self.errorMessage = "Campo vazio"
                } else {
                    self.errorMessage = ""
                }
                
            case "Email"?:
                if(text.count + string.count > 3) {
                    if(text.contains("@") || string.contains("@"))  {
                        self.errorMessage = ""
                    }
                } else {
                    self.errorMessage = "Email inválido"
                }
            case "Telefone"?:
                if text.count >= 9 {
                    let final = format(phoneNumber: text)
                    if(final.isEmpty) {
                        self.errorMessage = "Telefone inválido"
                    } else {
                        self.text = final
                        self.errorMessage = ""
                    }
                    
                } else {
                    self.errorMessage = ""
                }
                
            default:
                print("default")
                
            }
        }
        return true
    }
    
    
    
    
    func format(phoneNumber sourcePhoneNumber: String) -> String {
        
        // Remove any character that is not a number
        let numbersOnly = sourcePhoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let length = numbersOnly.count
        
        // Check for supported phone number length
        guard length == 9 || length == 10 || (length == 11) else {
            return ""
        }
        
        let hasAreaCode = (length > 8)
        var sourceIndex = 0
    
        // Area code
        var areaCode = ""
        if hasAreaCode {
            let areaCodeLength = 2
            guard let areaCodeSubstring = numbersOnly.substring(start: sourceIndex, offsetBy: areaCodeLength) else {
                return ""
            }
            areaCode = String(format: "(%@) ", areaCodeSubstring)
            sourceIndex += areaCodeLength
        }
        
        let prefixLength:Int
        let suffixLength:Int
        let prefix:String
        let suffix:String
        if(length == 9) {
            prefixLength = 4
            guard let p = numbersOnly.substring(start: sourceIndex, offsetBy: prefixLength) else {
                return ""
            }
            prefix = p
            sourceIndex += prefixLength
            suffixLength = 3
            guard let s = numbersOnly.substring(start: sourceIndex, offsetBy: suffixLength) else {
                return ""
            }
            suffix = s
            
        } else {
            prefixLength = 5
            guard let p = numbersOnly.substring(start: sourceIndex, offsetBy: prefixLength) else {
                return ""
            }
            prefix = p
            sourceIndex += prefixLength
            suffixLength = 3
            guard let s = numbersOnly.substring(start: sourceIndex, offsetBy: suffixLength) else {
                return ""
            }
            suffix = s
        }
        
        return  areaCode + prefix + "-" + suffix
    }
    
    func verifyEmptiness() -> Bool{
        guard let text = self.text else {
            return true
        }
        
        if text.isEmpty {
            return true
        } else {
            return false
        }
        
    }
}
