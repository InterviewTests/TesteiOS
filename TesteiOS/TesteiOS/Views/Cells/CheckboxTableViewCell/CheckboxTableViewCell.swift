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
    @IBOutlet weak var outerBox: UIView!
    @IBOutlet weak var innerBox: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    fileprivate var controller: FormController?
    fileprivate var model: FormItem?
    
    override func awakeFromNib() {
        outerBox.layer.borderColor = UIColor.gray.cgColor
        outerBox.layer.borderWidth = 1.5
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapCheckbox(_:)))
        outerBox.addGestureRecognizer(tap)
    }
    
    func configure(with model: FormItem, controller: FormController?) {
        self.controller = controller
        self.model = model
        
        self.titleLabel.text = model.message
        self.topConstraint?.constant = CGFloat(model.topSpacing)
    }
    
    @objc func didTapCheckbox(_ sender: UITapGestureRecognizer) {
        self.innerBox.isHidden = !self.innerBox.isHidden
        
        if let IDToShow = model?.show {
            if self.innerBox.isHidden {
                controller?.hideID(id: IDToShow)
            } else {
                controller?.showID(id: IDToShow)
            }
        }
    }
    
    
}
