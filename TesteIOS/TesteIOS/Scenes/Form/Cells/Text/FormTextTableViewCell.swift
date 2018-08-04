//
//  FormTextTableViewCell.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class FormTextTableViewCell: UITableViewCell, FormDefaultCellProtocol {
    
    @IBOutlet weak var fieldNameDistanceToTop: NSLayoutConstraint!
    @IBOutlet weak var fieldNameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        textField.setBottomLine()
    }
    
    //    MARK: - Set
    func setCell(cell: Form.FetchCells.ViewModel.DisplayedCell) {
        fieldNameDistanceToTop.constant = CGFloat(cell.topSpacing)
        fieldNameLabel.text = cell.message
    }
    
}
