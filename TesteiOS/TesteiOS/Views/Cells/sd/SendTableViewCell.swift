//
//  TextTableViewCell.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright © 2018 Felipe Borges. All rights reserved.
//

import UIKit

class SendTableViewCell: UITableViewCell, FormTableViewCell {
    @IBOutlet weak var topConstraint: NSLayoutConstraint?
    
    func configure(with model: FormItem) {
        self.sendButton.setTitle(model.message, for: .normal)
        self.topConstraint?.constant = CGFloat(model.topSpacing)
    }
    
    @IBOutlet weak var sendButton: UIButton!
    
    @IBAction func sendAction(_ sender: Any) {
        
    }
    
}
