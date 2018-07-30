//
//  SendTableViewCell.swift
//  TesteiOS
//
//  Created by Tiago Leme on 30/07/18.
//  Copyright © 2018 Tiago Leme. All rights reserved.
//

import UIKit

class SendTableViewCell: UITableViewCell {

    @IBOutlet weak var button: UICustomButton!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    func setCell(cell: Contact.FetchDynamicCells.ViewModel.DisplayableCell) {
        self.button.setTitle(cell.message, for: .normal)
        self.topConstraint.constant = CGFloat(cell.topSpacing)
    }

}
