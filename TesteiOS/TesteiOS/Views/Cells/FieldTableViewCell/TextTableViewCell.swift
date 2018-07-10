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
    
    func configure(with model: FormItem) {
        
        self.textlabel.text = model.message
    }
    
    @IBOutlet weak var textlabel: UILabel!
}
