//
//  TextFieldTableViewCell.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit
import MaterialComponents

class TextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var txField: MDCTextField!
    
    private var txFieldController: MDCTextInputControllerLegacyDefault?
    private var type:Type!
    private var typeField:TypeField!
    private var validator:Validator!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(cell:CellList) {
        
        guard let typeTF = cell.typefield else {
            return
        }
        
        guard let typeCell = cell.type else {
            return
        }
        

        self.typeField = TypeField.fromString("\(typeTF)")
        self.type = Type(rawValue: typeCell)!
        self.validator = Validator(typefield: self.typeField)
        
        self.txFieldController = MDCTextInputControllerLegacyDefault(textInput: self.txField)
        
        self.txFieldController?.floatingPlaceholderActiveColor = UIColor.borderColor()
        self.txFieldController?.placeholderText = self.typeField.titleField
        
        self.txField.delegate = self
        
    }
    
    static func register(to tableView:UITableView) {
        let nib = UINib(nibName: "TextFieldTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TextFieldTableViewCell")
    }
    
}

extension TextFieldTableViewCell: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch self.validator.typefield {
        case .email:
            let text = textField.text ?? ""
            if self.validator.validateEmail(email: text) {
                self.txFieldController?.activeColor = UIColor.textFieldSuccess()
            }else{
                self.txFieldController?.activeColor = UIColor.textFieldFailure()
            }
        case .telNumber:
            let text = textField.text ?? ""
            if self.validator.validatePhone(phone: text) {
                self.txFieldController?.activeColor = UIColor.textFieldSuccess()
            }else{
                self.txFieldController?.activeColor = UIColor.textFieldFailure()
            }
        default:
            let text = textField.text ?? ""
            if self.validator.validate(text) {
                self.txFieldController?.activeColor = UIColor.textFieldSuccess()
            }else{
                self.txFieldController?.activeColor = UIColor.textFieldFailure()
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch self.validator.typefield {
        case .email:
            if let text = textField.text {
                if let textRange = Range(range, in: text) {
                    let updateText = text.replacingCharacters(in: textRange, with: string)
                    
                    if updateText.isEmpty {
                        self.txFieldController?.activeColor = UIColor.borderColor()
                    }else{
                        if self.validator.validateEmail(email: updateText) {
                            self.txFieldController?.activeColor = UIColor.textFieldSuccess()
                        }else{
                            self.txFieldController?.activeColor = UIColor.textFieldFailure()
                        }
                    }
                    
                }
                
            }
        case .telNumber:
            var text = textField.text ?? ""
            text.append(string)
            if range.length == 1 {
                self.txFieldController?.activeColor = UIColor.textFieldFailure()
                textField.text = self.validator.format(phoneNumber: text, shouldRemoveLastDigit: true)
            } else {
                textField.text = self.validator.format(phoneNumber: text)
                if self.validator.validatePhone(phone: textField.text!) {
                    self.txFieldController?.activeColor = UIColor.textFieldSuccess()
                }else{
                    self.txFieldController?.activeColor = UIColor.textFieldFailure()
                }
            }
            return false
        default:
            if let text = textField.text {
                if let textRange = Range(range, in: text) {
                    let updateText = text.replacingCharacters(in: textRange, with: string)
                    
                    if updateText.isEmpty {
                        self.txFieldController?.activeColor = UIColor.borderColor()
                    }else{
                        if self.validator.validate(updateText) {
                            self.txFieldController?.activeColor = UIColor.textFieldSuccess()
                        }else{
                            self.txFieldController?.activeColor = UIColor.textFieldFailure()
                        }
                    }
                    
                }
            }
        }
        return true
    }
}
