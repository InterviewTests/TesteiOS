//
//  Email.swift
//  TesteiOS
//
//  Created by Andre Paganin on 05/09/18.
//  Copyright © 2018 Andre Paganin. All rights reserved.
//

import UIKit
import Foundation
import SkyFloatingLabelTextField

class MyViewController: UIViewController, UITextFieldDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        let textField1 = SkyFloatingLabelTextField
        textField1.placeholder = "Email"
        textField1.title = "Email address"

        textField1.delegate = self
        self.view.addSubview(textField1)
    }
    
    /// Implementing a method on the UITextFieldDelegate protocol. This will notify us when something has changed on the textfield
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            if let floatingLabelTextField = textField as? SkyFloatingLabelTextField {
                if(text.characters.count < 3 || !text.containsString("@")) {
                    floatingLabelTextField.errorMessage = "Invalid email"
                }
                else {
                    // The error message will only disappear when we reset it to nil or empty string
                    floatingLabelTextField.errorMessage = ""
                }
            }
        }
        return true
    }
}
