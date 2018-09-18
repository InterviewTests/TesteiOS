//
//  TextFieldDelegate.swift
//  TesteiOS
//
//  Created by Nicolau on 14/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import UIKit

extension FormVC {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let textField = textField as? CustomTextField {
            if textField.statusView.status == .noFocus {
                textField.statusView.changeStatus(to: .focused)
            }
            textField.customPlaceholderLabel.changeStatus(to: .focused)
            
            scrollView.setContentOffset(CGPoint(x: 0, y: textField.center.y - 160), animated: true)
            viewDidLayoutSubviews()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let textField = textField as? CustomTextField {
            if textField.text == "" {
                if textField.statusView.status == .focused {
                    textField.statusView.changeStatus(to: .noFocus)
                }
                textField.customPlaceholderLabel.changeStatus(to: .noFocus)
            }
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let customtextField = textField as? CustomTextField else { return true }
        
        if customtextField.typeField == .telNumber {
        
            if textField.text!.count == 15 && string != "" { return false }
            
            if let text = textField.text {
            
                if validateAreaCode(candidate: text) {
                    textField.text = "(" + text + ") "
                } else if text.count < 2  {
                    textField.text = text.removing(elementsOf: ["(", ")", " "])
                }
                
                if text.count == 12 && validatePhoneNumber(candidate: text.removing(elementsOf: ["-"]).substring(from: 5)) {
                    textField.text = text.removing(elementsOf: ["-"]).inserting("-", at: 9)
                    
                } else if textField.text!.count < 12 {
                    textField.text = textField.text?.removing(elementsOf: ["-"])
                    
                } else if textField.text!.count == 14 && validatePhoneNumber(candidate: textField.text!.removing(elementsOf: ["-"]).substring(from: 5)) {
                    textField.text = textField.text?.removing(elementsOf: ["-"]).inserting("-", at: 10)
                    
                } else if textField.text!.removing(elementsOf: ["-"]).count == 14 && validatePhoneNumber(candidate: textField.text!.removing(elementsOf: ["-"]).substring(from: 6)) {
                    textField.text = textField.text?.removing(elementsOf: ["-"]).inserting("-", at: 9)
                }
            }
        }
        
        return true
    }
    
    func validateAreaCode(candidate: String) -> Bool {
        let phoneRegex = "^[0-9]{2}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: candidate)
    }
    
    func validatePhoneNumber(candidate: String) -> Bool {
        let phoneRegex = "^[0-9]{7,8}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: candidate)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? CustomTextField {
            nextField.becomeFirstResponder()
        } else {
            dismissKeyboard()
        }
        
        return false
    }
    
    func dismissTextFields() {
        for view in self.view.subviews {
            if let textField = view as? CustomTextField {
                if textField.text == "" && !textField.isFocused {
                    if textField.statusView.status == .focused {
                        textField.statusView.changeStatus(to: .noFocus)
                    }
                    textField.customPlaceholderLabel.changeStatus(to: .noFocus)
                }
            }
        }
        
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        viewDidLayoutSubviews()
    }
}
