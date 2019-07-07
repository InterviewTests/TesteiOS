//
// InputPhoneTableViewCell.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 06/07/19.
//

import UIKit

class InputPhoneTableViewCell: InputTextFieldTableViewCell {
    
    private let olderMask: String = "(NN) NNNN-NNNN"
    private let newerMask: String = "(NN) NNNNN-NNNN"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func editingChanged() {
        let text = textField.text ?? ""
        let raw = text.removingNonDigitCharacters
        let maskTextField = textField as? SwiftMaskField
        
        if raw.count < 11 {
            maskTextField?.maskString = olderMask
        } else {
            maskTextField?.maskString = newerMask
        }
        
        if raw.count <= 11 {
            delegate?.editingChanged(text: text, atCell: self)
        }
    }
}
