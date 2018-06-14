//
//  CheckButtonTableViewCell.swift
//  TesteIOS
//
//  Created by Sidney Silva on 12/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

protocol CheckButtonDelegate {
    func checkButtonIsClicked(formCell: Cell)
}

class CheckButtonTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var btnCheckButton: UIButton!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    var delegate: CheckButtonDelegate!
    var check = false
    
    var formCell: Cell!
    
    func configureCell() {
        guard formCell.message != nil, formCell.topSpacing != nil else {
            return
        }
        
        self.titleLabel.text = formCell.message!
        self.titleLabel.sizeToFit()
        self.topConstraint.constant = CGFloat(formCell.topSpacing!)
    }
    
    func setCheckColor() {
        self.check = !self.check
        if self.check {
            self.btnCheckButton.backgroundColor = Colors.checked
        } else {
            self.btnCheckButton.backgroundColor = Colors.unchecked
        }
    }
    
    @IBAction func tapCheckButton(_ sender: Any) {
        self.setCheckColor()
        delegate.checkButtonIsClicked(formCell: self.formCell)
    }
}
