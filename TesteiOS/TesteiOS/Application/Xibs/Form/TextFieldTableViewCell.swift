//
//  TextFieldTableViewCell.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit
import MaterialComponents

protocol TextFieldTableViewCellDelegate: class {
    func validate(field:MDCTextField)
}

class TextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var txField: MDCTextField!
    
    var txFieldController: MDCTextInputControllerLegacyDefault?
    weak var delgate:TextFieldTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(cell:CellList) {
        
        guard let typeTF = cell.typefield else {
            return
        }
        
        guard let typeCell = cell.type else {
            return
        }
        
        let textFieldType:TypeField = TypeField.fromString(typeTF as! String)
        let cellType:Type = Type(rawValue: typeCell)!
        
        self.txFieldController = MDCTextInputControllerLegacyDefault(textInput: self.txField)
        
        self.txFieldController?.placeholderText = textFieldType.titleField
        
        self.txFieldController?.disabledColor = UIColor.borderColor()

        self.delgate?.validate(field: self.txField)
        
    }
    
    static func register(to tableView:UITableView) {
        let nib = UINib(nibName: "TextFieldTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TextFieldTableViewCell")
    }
    
}
