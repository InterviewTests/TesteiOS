//
//  ButtonTableViewCell.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//

import UIKit

protocol SendButtonDelegate {
    func validateFields()
}

class ButtonTableViewCell: UITableViewCell {
    @IBOutlet weak var btnEnviar: UIButton!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    var delegate: SendButtonDelegate!
    
    func configureCell(formCell: Cell) {
        guard formCell.message != nil, formCell.topSpacing != nil else {
            return
        }
        
        btnEnviar.titleLabel?.text = formCell.message!
        topConstraint.constant = CGFloat(formCell.topSpacing!)
    }
    
    @IBAction func tapEnviar(_ sender: Any) {
        delegate.validateFields()
    }
}
