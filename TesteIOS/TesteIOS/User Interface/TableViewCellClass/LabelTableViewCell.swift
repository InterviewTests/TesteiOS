//
//  LabelTableViewCell.swift
//  TesteIOS
//
//  Created by Sidney Silva on 12/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class LabelTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    func configureLabel(formCell: Cell) {
        guard formCell.message != nil, formCell.topSpacing != nil else {
            return
        }
        self.titleLabel.text = formCell.message!
        self.titleLabel.sizeToFit()
        self.topConstraint.constant = CGFloat(formCell.topSpacing!)
    }

}
