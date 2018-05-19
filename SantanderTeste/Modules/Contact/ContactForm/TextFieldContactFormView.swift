//
//  TextFieldContactForm.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import UIKit

class TextFieldContactFormView: BaseContactFormView {
    
    private var textField: MaskedTextField = {
        let textField = MaskedTextField(frame: CGRect())
        textField.font = UIFont(name: "DINPro-Medium", size: 17) ??
            UIFont.systemFont(ofSize: 17)
//        textField.defaultTextColor = .customLightGray
        textField.placeholderColor = .customLightGray
        textField.selectedTitleColor = .customLightGray
        textField.lineColor = .customLightGray
        textField.selectedLineColor = .customLightGray
        textField.textColor = .customDarkGray
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override var cell: ContactFormItem? {
        didSet {
            textField.placeholder = cell?.message
            textField.title = cell?.message
            
            if cell?.typefield == .telNumber || cell?.message == "Telefone" {
                textField.keyboardType = .numberPad
                textField.maskString = "(NN) NNNNN-NNNN"
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textField)
        textField.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textField.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func textDidChange() {
        cell?.textValue = textField.text ?? ""
        
        if cell?.typefield == .email, let isValid = textField.text?.isValidEmail() {
            if textField.text?.isEmpty ?? true || isValid {
                textField.selectedLineColor = .customLightGray
                textField.lineColor = .customLightGray
            } else {
                textField.selectedLineColor = .customRedOne
                textField.lineColor = .customRedOne
            }
        }
    }
}
