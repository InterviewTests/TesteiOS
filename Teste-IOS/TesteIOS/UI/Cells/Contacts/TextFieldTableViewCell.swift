//
//  TextFieldTableViewCell.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//

import UIKit
import AnyFormatKit

protocol ValidateTextField {
    func validate()
}

class TextFieldTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var txtField: UITextField!
    
    var isValid = false
    var formCell: Cell!
    var delegate: ValidateTextField!
    
    func configureLabel() {
        guard formCell.message != nil, formCell.topSpacing != nil else {
            return
        }
        
        self.titleLabel.text = formCell.message!
        self.titleLabel.sizeToFit()
        self.topConstraint.constant = CGFloat(formCell.topSpacing!)
    }
    
    @IBAction func textFieldDidChanged(_ sender: Any) {
        self.setupPhoneMask()
        if self.txtField.fieldValidate(typeField: formCell.typefield!) {
            self.isValid = true
            borderView.backgroundColor = Colors.valid
        } else {
            self.isValid = false
            borderView.backgroundColor = Colors.invalid
        }
    }
    
    func setupPhoneMask() {
        if formCell.typefield == .telNumber {
            let string = txtField?.text?.getOnlyDigits() ?? ""
            txtField?.text = ValidateUtil.phoneFormat(stringPhone: string)
        }
    }
    
}

