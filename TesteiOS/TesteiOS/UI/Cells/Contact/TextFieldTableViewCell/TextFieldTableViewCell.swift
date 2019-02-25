//
//  TextFieldTableViewCell.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 22/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit
import JMMaskTextField_Swift

final class TextFieldTableViewCell: ContactBaseTableViewCell {
    
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet var textField: UITextField!
  @IBOutlet weak var lineView: UIView!
  
  var isTextValid: Bool = false {
    didSet {
      lineView.backgroundColor = isTextValid ? ColorPalette.green : ColorPalette.red
      if isTextValid {
        callback?((titleLabel.text!, textField.text!))
      }
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    textField.delegate = self
    textField.addTarget(self, action: #selector(resizeTitleLabel), for: .editingDidBegin)
    textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
  }
  
  @objc func resizeTitleLabel() {
    titleLabel.font = UIFont(name: FontNames.regular, size: 11)
    if textField.text!.isEmpty {
      lineView.backgroundColor = ColorPalette.silverChalice
    }
  }
  
  @objc func textFieldDidChange(_ textField: UITextField) {
    checkTextField(textField)
  }
  
  override func setup(with item: Cell) {
    super.setup(with: item)
    if item.message == "Telefone" {
      textField.textContentType = UITextContentType.telephoneNumber
      textField.keyboardType = .numberPad
    } else {
      let type = TypeField(rawValue: item.typefield ?? 0)
      textField.textContentType = type?.contentType ?? .name
      textField.keyboardType = type?.keyboardType ?? .default
    }
    titleLabel.text = item.message
    textField.text = .none
    lineView.backgroundColor = ColorPalette.isabelline
    titleLabel.font = UIFont(name: FontNames.regular, size: 16)
  }
  
  private func checkTextField(_ textField: UITextField) {
    guard let text = textField.text else { return }
    switch textField.textContentType! {
    case .name:
      isTextValid = text.count >= 5
    case .telephoneNumber:
      isTextValid = text.count >= 10
    default:
      let newText = text.replacingOccurrences(of: " ", with: "")
      textField.text = newText
      isTextValid = newText.isValidEmail
    }
  }
}

extension TextFieldTableViewCell: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldShouldClear(_ textField: UITextField) -> Bool {
    callback?((self.titleLabel.text!, ""))
    return true
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if textField.textContentType == .telephoneNumber {
      guard let text = textField.text as NSString? else { return true }
      let newText = text.replacingCharacters(in: range, with: string)
      
      let maskTextField = textField as! JMMaskTextField
      maskTextField.maskString = "(00) 00000-0000"
      guard let unmaskedText = maskTextField.stringMask?.unmask(string: newText) else { return true }
      maskTextField.text = unmaskedText
      if unmaskedText.count >= 11 {
        maskTextField.maskString = "(00) 00000-0000"
        _ = textFieldShouldReturn(textField)
      } else {
        maskTextField.maskString = "(00) 0000-0000"
      }
      
      textFieldDidChange(maskTextField)
    }
    return true
  }
}
