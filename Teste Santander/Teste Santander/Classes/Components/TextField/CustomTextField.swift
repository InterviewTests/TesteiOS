//
//  CustomTextField.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 27/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import UIKit
import SwiftMaskTextfield

@IBDesignable
class CustomTextField: UIView, UITextFieldDelegate {
    // MARK: - Properties
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblPlaceholder: UILabel!
    @IBOutlet weak var txtInput: SwiftMaskTextfield!
    @IBOutlet weak var btnClearInput: UIButton!
    @IBOutlet weak var viewValidationStatus: UIView!
    
    // MARK: - Inspectable Variables
    @IBInspectable var placeHolderText: String = "" {
        didSet {
            lblPlaceholder.text = placeHolderText
        }
    }
    
    // MARK: - Input Type
    var inputType: TypeFieldEnum = .text
    
    // MARK: - Validation Constants
    fileprivate let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    fileprivate let phoneNumberMask = "(##) ####-####"
    fileprivate let cellPhoneNumberMask = "(##) #####-####"
    
    // MARK: - Validation Variables
    fileprivate var isRequired: Bool = false
    fileprivate var isValid: Bool = true
    
    // MARK: - Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initNib()
        configureUI()
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        initNib()
        configureUI()
    }
    
    override func awakeFromNib() {
        super .awakeFromNib()
        
        configureUI()
    }
    
    // MARK: - Public Methods
    func setup(placeHolderText: String, inputType: TypeFieldEnum, isRequired: Bool) {
        lblPlaceholder.text = placeHolderText
        self.inputType = inputType
        self.isRequired = isRequired
        
        switch inputType {
        case .text:
            txtInput.keyboardType = .default
        case .telNumber:
            txtInput.formatPattern = phoneNumberMask
            txtInput.keyboardType = .phonePad
        case .email:
            txtInput.keyboardType = .emailAddress
        default:
            txtInput.keyboardType = .default
        }
    }
    
    func isValidField() -> Bool {
        if isRequired {
            return isValid && !(txtInput.text?.isEmpty ?? true)
        }
        
        return true
    }

    // MARK: - PrivateMethods
    fileprivate func initNib() {
        let bundle = Bundle(for: CustomTextField.self)
        bundle.loadNibNamed(String(describing: CustomTextField.self), owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    fileprivate func configureUI() {
        btnClearInput.isHidden = (txtInput.text?.isEmpty ?? true)
        txtInput.delegate = self
        txtInput.returnKeyType = .done
    }
    
    fileprivate func configureViewValidation(input: String?) {
        if let input = input, !input.isEmpty {
            let validField = isValidEmail(input)
            
            viewValidationStatus.backgroundColor = validField ? ColorUtils.investment80 : ColorUtils.buttonRed
            isValid = validField
            
            return
        }
        
        viewValidationStatus.backgroundColor = ColorUtils.checkBoxBorder
    }
    
    fileprivate func isValidEmail(_ email: String) -> Bool {
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: email)
    }
    
    // MARK: - Actions
    @IBAction func clearInput(_ sender: Any) {
        txtInput.text = ""
        btnClearInput.isHidden = true
        viewValidationStatus.backgroundColor = ColorUtils.checkBoxBorder
        txtInput.font = FontUtils.mediumTextField
        lblPlaceholder.font = lblPlaceholder.font.withSize(16)
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        lblPlaceholder.font = lblPlaceholder.font.withSize(11)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true {
            lblPlaceholder.font = lblPlaceholder.font.withSize(16)
        }
    }
    
    @IBAction func inputDidChanged(_ sender: UITextField) {
        if inputType == .telNumber {
            txtInput.formatPattern = txtInput.text?.count ?? 0 <= 14 ? phoneNumberMask : cellPhoneNumberMask
        }
        
        btnClearInput.isHidden = (txtInput.text?.isEmpty ?? true)
        
        if inputType == .email {
            configureViewValidation(input: txtInput.text)
        }
    }
}
