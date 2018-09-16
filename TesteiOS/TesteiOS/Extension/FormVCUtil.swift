//
//  FormVCUtil.swift
//  TesteiOS
//
//  Created by Nicolau on 14/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import UIKit

extension FormVC {
    func setOutlets() {
        titleLabel.text = getMessage(fromCellId: 1, in: cells)

        fullNameTextField.delegate = self
        fullNameTextField.customPlaceholderLabel.text = getMessage(fromCellId: 2, in: cells)
        fullNameTextField.tag = 0
        fullNameTextField.returnKeyType = .next
        fullNameTextField.autocapitalizationType = .words

        emailTextField.delegate = self
        emailTextField.customPlaceholderLabel.text = getMessage(fromCellId: 4, in: cells)
        emailTextField.tag = 1
        emailTextField.returnKeyType = .next
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no

        phoneNumberTextField.delegate = self
        phoneNumberTextField.customPlaceholderLabel.text = getMessage(fromCellId: 6, in: cells)
        phoneNumberTextField.tag = 2
        phoneNumberTextField.returnKeyType = .done
        phoneNumberTextField.keyboardType = .phonePad

        checkbox.sideLabel.text = getMessage(fromCellId: 3, in: cells)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onCheckboxTapped))
        checkbox.addGestureRecognizer(tap)
    }
    
    func validate(textField: CustomTextField) -> Status {
        switch textField.tag {
        case 0:
            if textField.text != "" {
                return .correct
            }
            return .incorrect
        case 1:
            if let text = textField.text {
                if validateEmail(candidate: text) {
                    return .correct
                }
            }
            return .incorrect
        case 2:
            if let text = textField.text {
                if validatePhone(candidate: text.replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ") ", with: "").replacingOccurrences(of: "-", with: "")) {
                    return .correct
                }
            }
            return .incorrect
        default:
            return .noFocus
        }
    }
    
    func validatePhone(candidate: String) -> Bool {
        let phoneRegex = "^[0-9]{10,11}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: candidate)
    }
    
    func validateEmail(candidate: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
    }
}
