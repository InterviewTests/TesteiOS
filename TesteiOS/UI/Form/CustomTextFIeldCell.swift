//
//  CustomTextFIeldCell.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 08/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class CustomTextFieldCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var txtField: SkyFloatingLabelTextField!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func layoutSubviews() {
        self.txtField.delegate = self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // Validar o campo de acordo com o tipo
    @IBAction func txtChanged(_ sender: SkyFloatingLabelTextField) {
        sender.validateField()
    }
 
    // Limitar o tamanho do campo
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Tratamento para backspace
        let  char = string.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        
        if (isBackSpace == -92) {
            return true
        }
        // Limpar string
        let cleanedString = General.removeSpecialCharsFromString(textField.text!)
        return (cleanedString.utf16.count) < 11
    }
}
