//
//  FormFieldTableViewCell.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 09/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import UIKit

class FormTableDataViewCell:GenericCellProtocol{
    var name: String
    var subTitle: String
    
    init(with screen:Screen) {
        self.name = screen.screen.title
        self.subTitle = screen.screen.fundName
    }
}

protocol GenericTextFieldCellProtocol{
    var placeholder:String{get}
    var cell:Cell{get}
   
}

class FormFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var formTextField: HoshiTextField!
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
    
    func setup(with model:GenericCellProtocol){
        self.formTextField.placeholder = model.name
    }
    
    
    
}
