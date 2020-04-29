//
//  CustomTextField.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 27/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation
import UIKit

protocol CustomTextFieldProtocol {
    
}

@IBDesignable
class CustomTextField: UIView, UITextFieldDelegate {
    // MARK: - Properties
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblPlaceholder: UILabel!
    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var btnClearInput: UIButton!
    @IBOutlet weak var viewValidationStatus: UIView!
    
    // MARK: - Inspectable Variables
    @IBInspectable var placeHolderText: String = "" {
        didSet {
            lblPlaceholder.text = placeHolderText
        }
    }
    
    fileprivate var inputType: TypeFieldEnum = .text
    
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
    func setup(placeHolderText: String, inputType: TypeFieldEnum) {
        lblPlaceholder.text = placeHolderText
        self.inputType = inputType
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
    }
    
    fileprivate func configureViewValidation(input: String?) {
        if let input = input, !input.isEmpty {
            viewValidationStatus.backgroundColor = isValidEmail(input) ? #colorLiteral(red: 0.2899999917, green: 0.7570000291, blue: 0.423999995, alpha: 1) : #colorLiteral(red: 0.8550000191, green: 0.00400000019, blue: 0.00400000019, alpha: 1)
            
            return
        }
        
        viewValidationStatus.backgroundColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    }
    
    fileprivate func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: email)
    }
    
    // MARK: - Actions
    @IBAction func clearInput(_ sender: Any) {
        txtInput.text = ""
        btnClearInput.isHidden = true
        viewValidationStatus.backgroundColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        lblPlaceholder.font = lblPlaceholder.font.withSize(16)
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        lblPlaceholder.font = lblPlaceholder.font.withSize(11)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if txtInput.text?.isEmpty ?? true {
            lblPlaceholder.font = lblPlaceholder.font.withSize(16)
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        btnClearInput.isHidden = (txtInput.text?.isEmpty ?? true)
        
        if inputType == .email {
            configureViewValidation(input: textField.text)
        }
    }
}
