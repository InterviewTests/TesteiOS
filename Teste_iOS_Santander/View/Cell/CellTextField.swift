//
//  CellTextField.swift
//  Teste_iOS_Santander
//
//  Created by Fabricio Rodrigues on 20/09/2018.
//  Copyright © 2018 Fabricio Rodrigues. All rights reserved.
//

import UIKit


class CellTextField: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var labelField: UILabel!
    @IBOutlet var textFieldForm: UITextField!
    @IBOutlet weak var lineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        textFieldForm.clearButtonColor = UIColor.gray
        textFieldForm.clearButtonMode = .always
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        // Configure the view for the selected state
    }
    
}
