//
//  Extensions.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 28/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField
extension UIButton {
    func layoutRedButton() {
        self.backgroundColor = .red
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.red.cgColor
    }
    
    func setSelected() {
        self.isSelected = !self.isSelected
    }
    
}

extension SkyFloatingLabelTextField: UITextFieldDelegate{
    
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = self.text {
            switch self.accessibilityLabel {
                case "Nome"?:
                    if(text.count == 0) {
                        self.errorMessage = "Campo vazio"
                    } else {
                        self.errorMessage = ""
                    }
                
                case "Email"?:
                    if(text.count < 3 || !text.contains("@")) {
                        self.errorMessage = "email inválido"
                    } else {
                        self.errorMessage = ""
                    }
                case "Telefone"?:

                    if text.count >= 9  {
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
        print(numbersOnly)
        let length = numbersOnly.count
        
        // Check for supported phone number length
        guard length == 9 || length == 10 || (length == 11) else {
            
            return ""
        }
        
        let hasAreaCode = (length >= 9)
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
    
    func layoutTextField(configText:String) {
        self.delegate = self
        let lightGreyColor = UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1.0)
        self.errorColor = UIColor.red
        self.selectedTitleColor = lightGreyColor
        self.placeholder = configText
        self.title = self.placeholder
    }
}

extension String {

    internal func substring(start: Int, offsetBy: Int) -> String? {
        guard let substringStartIndex = self.index(startIndex, offsetBy: start, limitedBy: endIndex) else {
            return nil
        }
        
        guard let substringEndIndex = self.index(startIndex, offsetBy: start + offsetBy, limitedBy: endIndex) else {
            return nil
        }
        
        return String(self[substringStartIndex ..< substringEndIndex])
    }
}
