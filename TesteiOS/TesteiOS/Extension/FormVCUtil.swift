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

        emailTextField.delegate = self
        emailTextField.customPlaceholderLabel.text = getMessage(fromCellId: 4, in: cells)
        emailTextField.tag = 1
        emailTextField.returnKeyType = .next

        phoneNumberTextField.delegate = self
        phoneNumberTextField.customPlaceholderLabel.text = getMessage(fromCellId: 6, in: cells)
        phoneNumberTextField.tag = 2
        phoneNumberTextField.returnKeyType = .done

        checkbox.sideLabel.text = getMessage(fromCellId: 3, in: cells)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onCheckboxTapped))
        checkbox.addGestureRecognizer(tap)
    }
    
    func validate(textField: CustomTextField) -> Status {
        switch textField.typeField {
        case .text:
            if textField.text != "" {
                return .correct
            }
            return .incorrect
        case .email:
            if let text = textField.text {
                if validateEmail(candidate: text) {
                    return .correct
                }
            }
            return .incorrect
        case .telNumber:
            if let text = textField.text {
                if validatePhone(candidate: text.removing(elementsOf: ["(", ")", " ", "-"])) {
                    return .correct
                }
            }
            return .incorrect
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
    
    func clearForm() {
        if let scrollView = self.view.subviews[0] as? UIScrollView {
            for view in scrollView.subviews[0].subviews  {
                if let textField = view as? CustomTextField {
                    textField.text = ""
                    textField.customPlaceholderLabel.changeStatus(to: .noFocus)
                    textField.statusView.changeStatus(to: .noFocus)
                }
            }
        }
        
        if checkbox.isSelected {
            checkbox.changeState()
        }
    }
}
