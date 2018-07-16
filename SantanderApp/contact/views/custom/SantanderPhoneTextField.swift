//
//  SantanderPhoneTextField.swift
//  SantanderApp
//
//  Created by Andre Nogueira
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit
import SwiftValidators

class SantanderPhoneTextField: UIView {

    @IBOutlet weak var lineStatus: UIImageView!
    @IBOutlet weak var foneTextField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var isValid: Bool? = false
    public override func awakeFromNib() {
        self.foneTextField.delegate = self
    }

}

extension SantanderPhoneTextField: UITextFieldDelegate{
    
    
    private func textFieldDidBeginEditing(textField: UITextField!) {    //delegate method
        
    }
    
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {  //delegate method
        let validator = Validator.isPhone(.pt_BR)
        if(validator.apply(textField.text)){
            self.lineStatus.image = UIImage(named: "line_green")
            self.isValid = true
            return true
        }
        self.lineStatus.image = UIImage(named: "line_red")
        
        return false
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        
        return true
    }
    
}
