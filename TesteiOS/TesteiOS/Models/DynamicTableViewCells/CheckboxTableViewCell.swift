//
//  CheckboxTableViewCell.swift
//  TesteiOS
//
//  Created by Tiago Leme on 30/07/18.
//  Copyright © 2018 Tiago Leme. All rights reserved.
//

import UIKit

class CheckboxTableViewCell: UITableViewCell {

    @IBOutlet weak var checkbox: UICheckBox!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    func setCell(cell: Contact.FetchDynamicCells.ViewModel.DisplayableCell) {
        self.checkbox.setTitle(cell.message, for: .normal)
        self.topConstraint.constant = CGFloat(cell.topSpacing)
    }

}
