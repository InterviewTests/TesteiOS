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
    
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var button: MDCRaisedButton!
    @IBOutlet var topConstraint: NSLayoutConstraint!
    
    private var id: Int!
    
    private weak var buttonDelegate: FormViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = false
        
        button.layer.cornerRadius = button.frame.height / 2
        button.layer.masksToBounds = true
        
        button.isUppercaseTitle = false
        
        buttonDelegate = nil
    }
    
    func configure(id: Int, message: String, fieldType: FieldType, userInput: Any?, enabled: Bool, hidden: Bool, topSpacing: Double, delegate: FormViewCellDelegate?) {
        self.id = id
        
        button.setTitle(message, for: .normal)
        button.setTitle(message, for: .disabled)
        button.setTitle(message, for: .focused)
        button.setTitle(message, for: .highlighted)
        button.setTitle(message, for: .selected)
        
        button.isHidden = hidden
        if enabled {
            activityIndicator.stopAnimating()
        } else {
            activityIndicator.startAnimating()
        }
        button.isEnabled = enabled
        
        topConstraint.constant = CGFloat(topSpacing)
        
        buttonDelegate = delegate
    }
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        buttonDelegate?.sendButtonPressed()
    }

}
