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
    
    var delegate: FormDefaultCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCell(cell: Form.FetchCells.ViewModel.DisplayedCell) {
        sendButton.setTitle(cell.message, for: .normal)
        
        buttonDistanceToTop.constant = CGFloat(cell.topSpacing)
    }

    //    MARK: - Action
    @IBAction func sendButtonTouched(_ sender: Any) {
        guard let delegate = delegate else {
            return
        }
        
        delegate.sendButtonTouched()
    }
}
