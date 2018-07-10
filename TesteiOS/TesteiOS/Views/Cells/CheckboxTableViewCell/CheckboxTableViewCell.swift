//
//  CheckboxTableViewCell.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright © 2018 Felipe Borges. All rights reserved.
//

import UIKit

class CheckboxTableViewCell: UITableViewCell, FormTableViewCell {
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint?
    
    func configure(with model: FormItem) {
        self.titleLabel.text = model.message
        self.topConstraint?.constant = CGFloat(model.topSpacing)

    }
    
    @objc func didTapCheckbox(_ sender: UITapGestureRecognizer) {
        self.innerBox.isHidden = !self.innerBox.isHidden
    }
    
    @IBOutlet weak var outerBox: UIView!
    @IBOutlet weak var innerBox: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        outerBox.layer.borderColor = UIColor.gray.cgColor
        outerBox.layer.borderWidth = 1.5
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapCheckbox(_:)))
        self.addGestureRecognizer(tap)
    }
}
