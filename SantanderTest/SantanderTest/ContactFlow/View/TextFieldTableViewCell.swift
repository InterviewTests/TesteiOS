//
//  TextFieldTableViewCell.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 30/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import UIKit

protocol TextFieldCellDelegate: NSObjectProtocol
{
    func onEditing(text: String, type: CustomTypeField, id: Int)
}

extension TextFieldTableViewCell: UITextFieldDelegate
{    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if let text = textField.text, typeField == .telNumber
        {
            if string.isEmpty
            {
                applyStatus(status: .error)
                
                if text.count == 15
                {
                    return true
                }
            }
            
            if range.location == 14 || range.location == 15
            {
                applyStatus(status: .ok)
            }
            
            if text.count < 15
            {
                nameTextField.text = text.maskPhone(pattern: "(##) #####-####", replacmentCharacter: "#")
                
                return true
            }
            
            return false
        }
        
        if let text = textField.text, typeField == .text
        {
            if text.count == 1 && string.isEmpty
            {
                applyStatus(status: .error)
            }
            else
            {
                applyStatus(status: .ok)
            }
            
            return true
        }
        
        if let text = textField.text, typeField == .email
        {
            if (text + string).isValidEmail
            {
                applyStatus(status: .ok)
            }
            else
            {
                applyStatus(status: .error)
            }
        }
        
        return true
    }
}

enum ColorTextFieldCell
{
    case normal, error, ok
}

class TextFieldTableViewCell: UITableViewCell
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var statusView: UIView!
    
    private var typeField: CustomTypeField!
    {
        didSet
        {
            if typeField == .email
            {
                nameTextField.keyboardType = .emailAddress
            }
            else if typeField == .telNumber
            {
                nameTextField.keyboardType = .numberPad
            }
            else
            {
                nameTextField.autocapitalizationType = .sentences
                nameTextField.keyboardType = .default
            }
        }
    }
    
    private var identifier: Int!
    
    weak var delegate: TextFieldCellDelegate?
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        nameTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func editingChanged(_ sender: UITextField)
    {
        delegate?.onEditing(text: sender.text ?? "", type: typeField, id: identifier)
    }
    
    func applyContent(placeholder: String?, text: String?, type: CustomTypeField?, id: Int)
    {
        nameLabel.text = placeholder ?? "-"
        
        nameTextField.text = text
        
        typeField = type ?? .text
        
        identifier = id
        
        applyStatus(status: .normal)
    }
    
    func applyStatus(status: ColorTextFieldCell)
    {
        if status == .normal && nameTextField.text == nil
        {
            statusView.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        }
        else
        {
            statusView.backgroundColor = status == .error ? #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1) : #colorLiteral(red: 0.6574365497, green: 0.8640290499, blue: 0.530384481, alpha: 1)
        }
    }
}
