//
//  SantanderNameTextField.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 26/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit
import SwiftValidators

class SantanderNameTextField: UIView {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lineStatus: UIImageView!
    
    @IBOutlet weak var nameField: UITextField!

    var isValid: Bool? = false
    public override func awakeFromNib() {
        self.nameField.delegate = self
    }
}
extension SantanderNameTextField: UITextFieldDelegate{
    
    
    private func textFieldDidBeginEditing(textField: UITextField!) {    //delegate method
        
    }
    
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {  //delegate method
        let validator = Validator.isEmpty()
        if(validator.apply(textField.text)){
            self.lineStatus.image = UIImage(named: "line_red")

            return false
        }
        self.lineStatus.image = UIImage(named: "line_green")
        self.isValid = true
        return true
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        
        return true
    }
    
}

