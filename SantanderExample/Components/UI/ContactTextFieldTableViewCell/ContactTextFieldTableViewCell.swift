//
//  ContactTextFieldTableViewCell.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 12/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import UIKit
import UnderLineTextField

class ContactTextFieldTableViewCell: UITableViewCell {
  
  @IBOutlet weak var textField: UnderLineTextField!
  @IBOutlet weak var clearButton: UIButton!
  
  var viewModel: Contact.ContactFormCell.ViewModel = Contact.ContactFormCell.ViewModel() {
    didSet {
      didSetViewModel()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    textField.delegate = self
    textField.validationType = .afterEdit
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    clearButton.isHidden = true
  }
  
  private func didSetViewModel() {
    textField.placeholder = viewModel.text
  }
  
  @IBAction func clearButtonTouchUpInside(_ sender: Any) {
    textField.text = ""
    clearButton.isHidden = true
    textField.status = .normal
  }
}

extension ContactTextFieldTableViewCell: UnderLineTextFieldDelegate, UITextFieldDelegate {
  func textFieldValidate(underLineTextField: UnderLineTextField) throws {
    guard let text = underLineTextField.text else {
      return
    }
    
    switch viewModel.validationType {
    case .email:
      if !ValidationWorker.validate(email: text) {
        throw UnderLineTextFieldErrors
          .error(message: "Email inválido")
      }
      
    case .telNumber:
      if !ValidationWorker.validate(phoneNumber: text) {
        throw UnderLineTextFieldErrors
          .error(message: "Telefone inválido")
      }
      
    case .text:
      if text.count == 0 {
        throw UnderLineTextFieldErrors
          .error(message: "Nome inválido")
      }
    }
  }
  
  func textFieldTextChanged(underLineTextField: UnderLineTextField) {
    guard let text = underLineTextField.text else {
      return
    }
    
    if viewModel.validationType == .telNumber {
      underLineTextField.text = MaskUtil.formattedNumber(with: "(XX) XXXXX-XXXX", and: text)
    }
    
    if text.isEmpty {
      clearButton.isHidden = true
    } else {
      clearButton.isHidden = false
    }
  }
}

extension ContactTextFieldTableViewCell {
  
  enum CellSize: CGFloat {
    case normal = 100
  }
}
