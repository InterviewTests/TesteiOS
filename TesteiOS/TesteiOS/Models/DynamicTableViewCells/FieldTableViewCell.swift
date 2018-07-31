//
//  FieldTableViewCell.swift
//  TesteiOS
//
//  Created by Tiago Leme on 30/07/18.
//  Copyright © 2018 Tiago Leme. All rights reserved.
//

import UIKit

class FieldTableViewCell: UITableViewCell {

    @IBOutlet weak var textfield: UICustomTextfield!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    var isValid: Bool = false
    var id: Int!

    func setCell(cell: Contact.FetchDynamicCells.ViewModel.DisplayableCell){
        self.textfield.labelText = cell.message
        self.topConstraint.constant = CGFloat(cell.topSpacing)
        self.heightConstraint.constant = 56
        self.id = cell.id
        
 
        switch cell.typeField {
            case 1:
                self.textfield.validationRegEx = ".{1,}"
            case 3:
                self.textfield.validationRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                self.textfield.keyboardType = .emailAddress
            default:
                self.textfield.validationRegEx = "\\([0-9]{2}\\)\\s[0-9]{4,5}-[0-9]{4}"
                self.textfield.masks = ["(##) ####-####", "(##) #####-####"]
                self.textfield.keyboardType = .namePhonePad
        }
    }
    
}
