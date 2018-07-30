//
//  FieldTableViewCell.swift
//  TesteiOS
//
//  Created by Tiago Leme on 30/07/18.
//  Copyright © 2018 Tiago Leme. All rights reserved.
//

import UIKit

class FieldTableViewCell: UITableViewCell {

    @IBOutlet weak var textfield: UICustomTexfield!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    func setCell(cell: Contact.FetchDynamicCells.ViewModel.DisplayableCell){
        self.textfield.labelText = cell.message
        self.topConstraint.constant = CGFloat(cell.topSpacing)
    }
}
