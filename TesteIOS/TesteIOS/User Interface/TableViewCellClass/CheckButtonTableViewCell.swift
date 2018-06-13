//
//  CheckButtonTableViewCell.swift
//  TesteIOS
//
//  Created by Sidney Silva on 12/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class CheckButtonTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var btnCheckButton: UIButton!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    
    func configureCell(formCell: Cell) {
        guard formCell.message != nil, formCell.topSpacing != nil else {
            return
        }
        self.titleLabel.text = formCell.message!
        self.topConstraint.constant = CGFloat(formCell.topSpacing!)
    }
    
    @IBAction func tapCheckButton(_ sender: Any) {
        print("teste")
    }
    
}
