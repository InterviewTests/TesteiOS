//
//  PasswordTextField.swift
//  TesteiOS
//
//  Created by Gabriel Soria Souza on 20/10/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import Foundation
import UIKit

class PasswordTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.placeholder = " Password"
        self.layer.borderWidth = 0.25
        self.layer.cornerRadius = 3
        self.autocorrectionType = .no
        self.keyboardType = .default
        self.returnKeyType = .done
        self.isSecureTextEntry = true
        self.delegate = self
        if #available(iOS 10.0, *) {
            if #available(iOS 11.0, *) {
                self.textContentType = UITextContentType.password
            } else {
                // Fallback on earlier versions
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PasswordTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var firstResponder = textField.resignFirstResponder()
        firstResponder = true
        return firstResponder
    }
}
