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
            } else {
                if textField == phoneNumberTextField {
                    if var text = textField.text {
                        text = text.replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ") ", with: "").replacingOccurrences(of: "-", with: "")
                        let textArr = Array(text)
                        
                        if text.count == 10 {
                            textField.text = "(" + String(textArr[0]) + String(textArr[1]) + ") "
                            for i in 2 ... 5 {
                                textField.text?.append(textArr[i])
                            }
                            
                            textField.text?.append("-")
                            
                            for i in 5 ... 8 {
                                textField.text?.append(textArr[i])
                            }
                        } else if text.count == 11 {
                            textField.text = "(" + String(textArr[0]) + String(textArr[1]) + ") "
                            for i in 2 ... 6 {
                                textField.text?.append(textArr[i])
                            }
                            
                            textField.text?.append("-")
                            
                            for i in 6 ... 9 {
                                textField.text?.append(textArr[i])
                            }
                        } else {
                            textField.text = text
                        }
                    }
                }
            }
        }
        
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
