//
//  SendTableViewCell.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright © 2018 Felipe Borges. All rights reserved.
//

import UIKit

class FieldTableViewCell: UITableViewCell, FormTableViewCell {
    @IBOutlet weak var topConstraint: NSLayoutConstraint?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var bottomBar: UIView!
    
    func configure(with model: FormItem, controller: FormController?) {
        nameLabel.text = model.message
        textField.placeholder = model.message
        self.topConstraint?.constant = CGFloat(model.topSpacing)
        
        switch model.fieldType {
        case .text:
            textField.keyboardType = .default
        case .email:
            textField.keyboardType = .emailAddress
        case .telNumber:
            textField.keyboardType = .numberPad
            setupToolBar()
        }
        
        textField.delegate = controller
        controller?.textFields.append(textField)
    }
    
    func setupToolBar() {
        let toolBar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.frame.size.width, height: 30))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton: UIBarButtonItem = UIBarButtonItem(title: "Pronto", style: .done, target: self, action: #selector(doneButtonAction))
        toolBar.setItems([flexSpace, doneButton], animated: false)
        toolBar.sizeToFit()
        
        self.textField.inputAccessoryView = toolBar
    }
    
    @objc func doneButtonAction() {
        self.textField.resignFirstResponder()
    }
}
