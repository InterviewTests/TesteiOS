//
//  FieldTableViewCell.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright © 2018 Felipe Borges. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell, FormTableViewCell {
    @IBOutlet weak var topConstraint: NSLayoutConstraint?
    
    @IBOutlet weak var bottomBar: UIView!
    
    @IBOutlet weak var textlabel: UILabel!
    
    func configure(with model: FormItem, controller: FormController?) {
        self.textlabel.font = UIFont(name: "DINPro-Regular", size: 17.0)
        self.textlabel.text = model.message
        self.topConstraint?.constant = CGFloat(model.topSpacing)
    }

}
