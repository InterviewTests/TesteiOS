//
//  TextTableViewCell.swift
//  TesteiOS
//
//  Created by Tiago Leme on 30/07/18.
//  Copyright © 2018 Tiago Leme. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    var id: Int!

    func setCell(cell: Contact.FetchDynamicCells.ViewModel.DisplayableCell){
        self.label.text = cell.message
        self.topConstraint.constant = CGFloat(cell.topSpacing)
        
        self.id = cell.id
    }
}
