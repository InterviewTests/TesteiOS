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

enum ValidIndicator {
    case valid
    case invalid
    case notChecked
}

class InputTextFieldTableViewCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var separatorView: UIView!

    weak var delegate: InputTextFieldTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textField.addTarget(self, action: #selector(editingChanged), for: UIControl.Event.editingChanged)
    }

    @objc func editingChanged() {
        let text = textField.text ?? ""
        delegate?.editingChanged(text: text, atCell: self)
    }
    
    func set(placeholder: String? = "") {
        self.textField.placeholder = placeholder
    }
    
    func setValidIndicatorColor(status: ValidIndicator) {
        switch status {
        case .valid:
            separatorView.backgroundColor = Colors.goodGreen
        case .invalid:
            separatorView.backgroundColor = Colors.badRed
        case .notChecked:
            separatorView.backgroundColor = Colors.shallowGray
        }
    }
}
