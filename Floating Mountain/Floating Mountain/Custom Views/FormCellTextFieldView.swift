//
//  FormCellTextFieldView.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 9/16/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextFields
import SwiftValidators
import PhoneNumberKit

class FormCellTextFieldView: FormCellView {
    
    lazy var textField: MDCTextField = {
        let textField = MDCTextField()
        textField.clearButtonMode = .whileEditing
        textField.tintColor = #colorLiteral(red: 0.8549019608, green: 0.003921568627, blue: 0.003921568627, alpha: 1)
        textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        textField.sizeToFit()
        return textField
    }()
    
    private var isPhoneTextField = false
    lazy var phoneNumberFormatter = PartialFormatter(phoneNumberKit: PhoneNumberKit(), defaultRegion: "BR", withPrefix: false)
    
    var textFieldControllerFloating: MDCTextInputControllerFloatingPlaceholder!
    
    var validator: Validator?
    var errorDescription: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textFieldControllerFloating = initializeTextController()
        addSubview(textField)
        setupConstraints(for: textField)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        textFieldControllerFloating = initializeTextController()
        addSubview(textField)
        setupConstraints(for: textField)
    }
    
    private func initializeTextController() -> MDCTextInputControllerFloatingPlaceholder {
        let textFieldControllerFloating = MDCTextInputControllerUnderline(textInput: textField)
        textFieldControllerFloating.floatingPlaceholderNormalColor = #colorLiteral(red: 0.6745098039, green: 0.6745098039, blue: 0.6745098039, alpha: 1)
        textFieldControllerFloating.floatingPlaceholderActiveColor = #colorLiteral(red: 0.6745098039, green: 0.6745098039, blue: 0.6745098039, alpha: 1)
        textFieldControllerFloating.activeColor = #colorLiteral(red: 0.3960784314, green: 0.7450980392, blue: 0.1882352941, alpha: 1)
        textFieldControllerFloating.normalColor = #colorLiteral(red: 0.6745098039, green: 0.6745098039, blue: 0.6745098039, alpha: 1)
        textFieldControllerFloating.errorColor = #colorLiteral(red: 1, green: 0.1215686275, blue: 0.1215686275, alpha: 1)
        textFieldControllerFloating.textInputFont = regularFont
        textFieldControllerFloating.inlinePlaceholderFont = regularFont
        return textFieldControllerFloating
    }
    
    override func setup(for formCell: Contact.FetchForm.ViewModel.CellViewModel) {
        super.setup(for: formCell)
        textField.placeholder = formCell.message
        switch formCell.typefield! {
        case .text:
            textField.autocapitalizationType = .words
            if #available(iOS 10.0, *) {
                textField.textContentType = .name
            }
            if formCell.required {
                validator = Validator.required()
                errorDescription = "Campo obrigatório"
            }
            break
        case .phoneNumber:
            textField.keyboardType = .numberPad
            if #available(iOS 10.0, *) {
                textField.textContentType = .telephoneNumber
            }
            validator = Validator.regex("^([0-9]{2} [9][0-9]{4}-[0-9]{4})|([0-9]{2} [0-9]{4}-[0-9]{4})$")
            if formCell.required {
                validator = validator! && Validator.required()
            }
            errorDescription = "Telefone inválido"
            isPhoneTextField = true
            break
        case .email:
            textField.keyboardType = .emailAddress
            textField.autocapitalizationType = .none
            textField.autocorrectionType = .no
            if #available(iOS 10.0, *) {
                textField.textContentType = .emailAddress
            }
            validator = Validator.isEmail()
            if formCell.required {
                validator = validator! && Validator.required()
            }
            errorDescription = "Email inválido"
            break
        }
    }
    
    @discardableResult
    override func isValid() -> Bool {
        let isValid = (validator?.apply(textField.text) ?? true) || isHidden
        validateInputValue(valid: isValid)
        return isValid
    }
    
    func validateInputValue(valid: Bool) {
        if valid {
            textFieldControllerFloating.setErrorText(nil, errorAccessibilityValue: nil)
        } else {
            textFieldControllerFloating.setErrorText(errorDescription, errorAccessibilityValue: nil)
        }
    }
    
    @objc func textDidChange() {
        if isPhoneTextField, let phone = textField.text {
            let filteredPhone = phone.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            textField.text = phoneNumberFormatter.formatPartial(filteredPhone)
        }
        isValid()
    }
    
}
