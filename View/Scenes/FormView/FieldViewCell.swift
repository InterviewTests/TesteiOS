//
//  FieldViewCell.swift
//  TesteiOS
//
//  Created by Erika de Almeida Segatto on 18/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents.MaterialTextFields
import Domain

class FieldViewCell: UITableViewCell, FormViewCell {
    
    @IBOutlet var textField: MDCTextField!    
    @IBOutlet var topConstraint: NSLayoutConstraint!
    
    private var textFieldController: MDCTextInputController?
    
    private var fieldType: FieldType? = nil
    private var validateFunction: ((String, FieldType)->Bool)!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // TextField Styles
        let textFieldStyle = ThemeManager.current().textFieldType
        textFieldController = textFieldStyle.init(textInput: textField)
        
        // Login textField delegate
        textField.delegate = self
    }
    
    func configure(message: String, fieldType: FieldType, validateFieldFunction: @escaping (String, FieldType)->(Bool), hidden: Bool, topSpacing: Double) {
        textField.clearText()
        textField.placeholder = message
        textField.isHidden = hidden
        
        self.fieldType = fieldType
        validateFunction = validateFieldFunction
        
        topConstraint.constant = CGFloat(topSpacing)
    }
    
    
    
}

extension FieldViewCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        let theme = ThemeManager.current()
        
        guard updatedString.count > 0 else {
            textFieldController?.activeColor = theme.fieldNeutralColor
            textFieldController?.setErrorText(nil, errorAccessibilityValue: nil)
            return true
        }
        if validateFunction(updatedString, fieldType ?? .text) {
            textFieldController?.activeColor = theme.fieldValidColor
            textFieldController?.setErrorText(nil, errorAccessibilityValue: nil)
        } else {
            textFieldController?.activeColor = theme.fieldNeutralColor
            textFieldController?.setErrorText("", errorAccessibilityValue: nil)
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
