//
//  FormFieldTableViewCell.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class FormFieldTableViewCell: UITableViewCell, FormDefaultCellProtocol {
    
    @IBOutlet weak var fieldLabelTopDistance: NSLayoutConstraint!
    @IBOutlet weak var fieldLabel: UILabel!
    
    var delegate: FormDefaultCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //    MARK: - Config
    func setCell(cell: Form.FetchCells.ViewModel.DisplayedCell) {
        fieldLabel.text = cell.message
        fieldLabelTopDistance.constant = CGFloat(cell.topSpacing)
    }    
}
