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
    
    private var id: Int!
    private var fieldType: FieldType? = nil
    
    
    private weak var fieldDelegate: FormViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // TextField Styles
        let textFieldStyle = ThemeManager.current().textFieldType
        textFieldController = textFieldStyle.init(textInput: textField)
        
        // Login textField delegate
        textField.delegate = self
    }
    
    func configure(id: Int, message: String, fieldType: FieldType, userInput: Any?, hidden: Bool, topSpacing: Double, delegate: FormViewCellDelegate?) {
        self.id = id
        self.fieldType = fieldType
        
        textField.text = userInput as? String
        updateFieldOnUserInput(textField.text ?? "")
        textField.placeholder = message
        textField.isHidden = hidden
        
        switch fieldType {
        case .email: textField.keyboardType = .emailAddress
        case .telNumber: textField.keyboardType = .phonePad
        default: textField.keyboardType = .default
        }
        
        topConstraint.constant = CGFloat(topSpacing)
        
        fieldDelegate = delegate
    }

    
    
}

extension FieldViewCell: UITextFieldDelegate {
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        updateFieldOnUserInput("")
        return true
    }
    
    // MARK: update Field Color with text
    private func updateFieldOnUserInput(_ text: String) {
        
        fieldDelegate?.saveUserInput(text, id: id)
        
        let theme = ThemeManager.current()
        guard let validateFieldDelegate = fieldDelegate, let fieldType = fieldType, text.count > 0 else {
            textFieldController?.activeColor = theme.fieldNeutralColor
            textFieldController?.setErrorText(nil, errorAccessibilityValue: nil)
            return
        }
        if validateFieldDelegate.validateInput(text, fieldType: fieldType) {
            textFieldController?.activeColor = theme.fieldValidColor
            textFieldController?.setErrorText(nil, errorAccessibilityValue: nil)
        } else {
            textFieldController?.activeColor = theme.fieldNeutralColor
            textFieldController?.setErrorText("", errorAccessibilityValue: nil)
        }
    }
    
    // UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""

        if let fieldType = fieldType, fieldType == .telNumber {
            textField.text = updatedString.formatAsPhone()
            updateFieldOnUserInput(updatedString.formatAsPhone())
            return false
        }
        
        updateFieldOnUserInput(updatedString)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
