//
//  TextFieldTableViewCell.swift
//  TesteIOS
//
//  Created by Sidney Silva on 12/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

protocol ValidateTextField {
    func validate()
}

class TextFieldTableViewCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    var delegate: ValidateTextField!
    
    func configureLabel(formCell: Cell) {        
        guard formCell.message != nil, formCell.topSpacing != nil else {
            return
        }
        self.titleLabel.text = formCell.message!
        self.topConstraint.constant = CGFloat(formCell.topSpacing!)
    }
}

