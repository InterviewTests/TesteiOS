//
//  CheckboxTableViewCell.swift
//  TesteiOS
//
//  Created by Tiago Leme on 30/07/18.
//  Copyright © 2018 Tiago Leme. All rights reserved.
//

import UIKit

protocol CheckboxCellDelegate {
    func showElementWith(id: Int)
}

class CheckboxTableViewCell: UITableViewCell {
    
    var delegate: CheckboxCellDelegate?

    //MARK: - Outlets
    @IBOutlet weak var checkbox: UICheckBox!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    //MARK: - Class Variables
    var id: Int!
    var show: Int!

    //MARK: - Actions
    @IBAction func checkboxPressed(_ sender: UICheckBox) {
        guard self.delegate != nil else {
            return
        }
        self.delegate?.showElementWith(id: self.show)
    }

    func setCell(cell: Contact.FetchDynamicCells.ViewModel.DisplayableCell) {
        self.checkbox.setTitle(cell.message, for: .normal)
        self.topConstraint.constant = CGFloat(cell.topSpacing)
        
        self.id = cell.id
        self.show = cell.show
    }

}
