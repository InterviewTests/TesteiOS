//
//  SendTableViewCell.swift
//  TesteiOS
//
//  Created by Tiago Leme on 30/07/18.
//  Copyright © 2018 Tiago Leme. All rights reserved.
//

import UIKit

protocol SendCellDelegate {
    func sendButtonPressed()
}

class SendTableViewCell: UITableViewCell {

    var delegate: SendCellDelegate?

    //MARK: - Outlets
    @IBOutlet weak var button: UICustomButton!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    //MARK: - Class Variables
    var id: Int!
    
    //MARK: - Actions
    @IBAction func buttonPressed(_ sender: UICustomButton) {
        guard self.delegate != nil else {
            return
        }
        self.delegate?.sendButtonPressed()
    }
    
    func setCell(cell: Contact.FetchDynamicCells.ViewModel.DisplayableCell) {
        self.button.setTitle(cell.message, for: .normal)
        self.topConstraint.constant = CGFloat(cell.topSpacing)
        
        self.id = cell.id
    }

}
