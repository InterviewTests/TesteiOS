//
//  CustomTextFIeldCell.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 08/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class CustomTextFieldCell: UITableViewCell {

    @IBOutlet weak var txtField: SkyFloatingLabelTextField!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // Validar o campo de acordo com o tipo
    @IBAction func txtChanged(_ sender: SkyFloatingLabelTextField) {
        sender.validateField()
    }
    
}
