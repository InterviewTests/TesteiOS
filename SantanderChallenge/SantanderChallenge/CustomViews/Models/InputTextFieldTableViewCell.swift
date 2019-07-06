//
// InputTextFieldTableViewCell.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 06/07/19.
//

import UIKit

class InputTextFieldTableViewCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(placeholder: String? = "") {
        self.textField.placeholder = placeholder
    }

}
