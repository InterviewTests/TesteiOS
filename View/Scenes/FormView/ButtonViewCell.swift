//
//  ButtonViewCell.swift
//  TesteiOS
//
//  Created by Erika de Almeida Segatto on 14/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents.MaterialButtons
import Domain

class ButtonViewCell: UITableViewCell, FormViewCell {
    
    @IBOutlet var button: MDCRaisedButton!
    @IBOutlet var topConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = false
        
        button.layer.cornerRadius = button.frame.height / 2
        button.layer.masksToBounds = true
    }
    
    func configure(message: String, fieldType: FieldType, validateFieldFunction: @escaping (String, FieldType) -> (Bool), hidden: Bool, topSpacing: Double) {
        button.setTitle(message, for: .normal)
        button.setTitle(message, for: .disabled)
        button.setTitle(message, for: .focused)
        button.setTitle(message, for: .highlighted)
        button.setTitle(message, for: .selected)
        
        button.isHidden = hidden
        
        topConstraint.constant = CGFloat(topSpacing)
    }
    
    
    
}
