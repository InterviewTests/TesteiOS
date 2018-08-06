//
//  FormSendTableViewCell.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class FormSendTableViewCell: UITableViewCell, FormDefaultCellProtocol {
    
    @IBOutlet weak var buttonDistanceToTop: NSLayoutConstraint!
    @IBOutlet weak var sendButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        sendButton.layer.cornerRadius = sendButton.frame.height/2
    }
    
    func setCell(cell: Form.FetchCells.ViewModel.DisplayedCell) {
        sendButton.setTitle(cell.message, for: .normal)
        
        buttonDistanceToTop.constant = CGFloat(cell.topSpacing)
    }

}
