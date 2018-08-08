//
//  FormCheckboxTableViewCell.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit
import DLRadioButton

class FormCheckboxTableViewCell: UITableViewCell, FormDefaultCellProtocol {
    @IBOutlet weak var distanceToTop: NSLayoutConstraint!
    @IBOutlet weak var checkbox: DLRadioButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    var delegate: FormDefaultCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        checkbox.isMultipleSelectionEnabled = true
    }

    //    MARK: - Set
    func setCell(cell: Form.FetchCells.ViewModel.DisplayedCell) {
        distanceToTop.constant = CGFloat(cell.topSpacing)
        
        messageLabel.text = cell.message
    }
}
