//
// InputTextFieldTableViewCell.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 06/07/19.
//

import UIKit

protocol InputTextFieldTableViewCellDelegate: AnyObject {
    func editingChanged(text: String, atCell cell: InputTextFieldTableViewCell)
}

class InputTextFieldTableViewCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var separatorView: UIView!

    weak var delegate: InputTextFieldTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textField.addTarget(self, action: #selector(editingChanged), for: UIControl.Event.editingChanged)
    }

    @objc private func editingChanged() {
        let text = textField.text ?? ""
        delegate?.editingChanged(text: text, atCell: self)
    }
    
    func set(placeholder: String? = "") {
        self.textField.placeholder = placeholder
    }
    
    func setValidIndicatorColor(valid: Bool) {
        if valid {
            separatorView.backgroundColor = Colors.goodGreen
        } else {
            separatorView.backgroundColor = Colors.badRed
        }
    }
}
