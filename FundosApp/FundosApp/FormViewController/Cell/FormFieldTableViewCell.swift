//
//  FormFieldTableViewCell.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 09/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import UIKit

class FormTableDataViewCell:GenericTextFieldCellProtocol{
    var placeholder: String
    
    var type:Type
    var textFieldType:TypeField

    

    


    
    init(with cell:Cell) {
        self.placeholder = cell.message
  
        print(cell.type)
       
        self.type = cell.type ?? .text
        self.textFieldType = cell.typeField ?? .text
        if placeholder.contains("Tel"){
            self.textFieldType = .telNumber
        }

        if placeholder.contains("mail"){
            self.textFieldType = .email
        }
              print(textFieldType)
    }
}

protocol GenericTextFieldCellProtocol{
    var placeholder:String{get}
    var type:Type{get}
    var textFieldType:TypeField{get}
   
}

class FormFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var formTextField: HoshiTextField!
    
    var validator:Validator!
    var type:Type!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func register(to tableView:UITableView) {
        let nib = UINib(nibName: "FormFieldTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FormFieldTableViewCell")
    }
    
    func setup(with model:GenericTextFieldCellProtocol){
        self.formTextField.placeholder = model.placeholder
        validator = Validator(typefield: model.textFieldType)
        self.type = model.type
        formTextField.delegate = self
        formTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),
                                for: UIControlEvents.editingChanged)
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        switch validator.typefield {
        case .email:
            if validator.validateEmail(email: textField.text ??  ""){
                //valid
                formTextField.placeholderColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)

            }else{
                formTextField.placeholderColor = #colorLiteral(red: 0.8549019608, green: 0.003921568627, blue: 0.003921568627, alpha: 1)
                
            }
        case .telNumber:
            if validator.validatePhone(phone:textField.text ??  ""){
                //valid
                formTextField.placeholderColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            }else{
                formTextField.placeholderColor = #colorLiteral(red: 0.8549019608, green: 0.003921568627, blue: 0.003921568627, alpha: 1)
                
            }
        default:
            formTextField.placeholderColor = #colorLiteral(red: 0.3422979712, green: 0.3976092339, blue: 0.4628179669, alpha: 1)
            
        }

     
    }

}

extension FormFieldTableViewCell:UITextFieldDelegate{
    
}
