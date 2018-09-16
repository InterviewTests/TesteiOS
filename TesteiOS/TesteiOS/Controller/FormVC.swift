//
//  FormVC.swift
//  TesteiOS
//
//  Created by Nicolau on 13/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import UIKit

class FormVC: UIViewController, UITextFieldDelegate {
    
    let cellsJSON = "cells"
    var cells = [Cell]()
    
    // Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fullNameTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var phoneNumberTextField: CustomTextField!
    @IBOutlet weak var checkbox: CustomCheckbox!
    @IBOutlet weak var sendButton: CustomButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var sentMessageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sentMessageView.isHidden = true
        
        cells = decodeFormJSON(fromFile: cellsJSON)
        setOutlets()
        
        sendButton.addTarget(self, action: #selector(sendForm), for: .touchUpInside)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
        dismissTextFields()
    }
    
    @IBAction func onTextChange(_ sender: CustomTextField) {
        let status = validate(textField: sender)
        sender.statusView.changeStatus(to: status)
    }
    
    @objc func onCheckboxTapped() {
        checkbox.changeState()
    }
    
    @objc func sendForm() {
        if validate(textField: fullNameTextField) == .correct
            && validate(textField: emailTextField) == .correct
            && validate(textField: phoneNumberTextField) == .correct {
            fullNameTextField.text = ""
            fullNameTextField.customPlaceholderLabel.changeStatus(to: .noFocus)
            fullNameTextField.statusView.changeStatus(to: .noFocus)
        
            emailTextField.text = ""
            emailTextField.customPlaceholderLabel.changeStatus(to: .noFocus)
            emailTextField.statusView.changeStatus(to: .noFocus)
        
            phoneNumberTextField.text = ""
            phoneNumberTextField.customPlaceholderLabel.changeStatus(to: .noFocus)
            phoneNumberTextField.statusView.changeStatus(to: .noFocus)
        
            dismissTextFields()
            dismissKeyboard()
        
            sentMessageView.isHidden = false
        }
    }
    
    @IBAction func newMessage(_ sender: Any) {
        sentMessageView.isHidden = true
    }
}
