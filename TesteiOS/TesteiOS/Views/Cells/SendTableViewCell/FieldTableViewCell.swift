//
//  SendTableViewCell.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright © 2018 Felipe Borges. All rights reserved.
//

import UIKit

class FieldTableViewCell: UITableViewCell, FormTableViewCell {
    @IBOutlet weak var topConstraint: NSLayoutConstraint?
    
    func configure(with model: FormItem) {
        nameLabel.text = model.message
        textField.placeholder = model.message
        self.topConstraint?.constant = CGFloat(model.topSpacing)
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var bottomBar: UIView!
}
