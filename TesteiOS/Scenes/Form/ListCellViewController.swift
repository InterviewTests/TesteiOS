//
//  ListCellViewController.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 07/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import Foundation
import UIKit
import M13Checkbox

protocol ListCellViewControllerInput
{
    
}

protocol ListCellViewControllerOutput
{
    func fetchItems()
}

enum itemType : Int {
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
}

enum typeField : Int {
    case text = 1
    case telNumber = 2
    case email = 3
}

// Tableview
extension ListCellViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let formItem = listCell[indexPath.row]
        
        switch formItem.type {
        case itemType.field.rawValue:
            let textFieldCell = tableView.dequeueReusableCell(withIdentifier: "text_field_cell", for: indexPath) as! CustomTextFieldCell
            
            // Margem do topo
            textFieldCell.topConstraint.constant = CGFloat(formItem.topSpacing)
            // Placeholder (floating label)
            textFieldCell.txtField.placeholder = formItem.message
            
            textFieldCell.isHidden = formItem.hidden
            
            return textFieldCell
            
        case itemType.text.rawValue:
            let labelCell = tableView.dequeueReusableCell(withIdentifier: "label_cell", for: indexPath) as! LabelCell
            
            // Margem do topo
            labelCell.topConstraint.constant = CGFloat(formItem.topSpacing)
            // Popular label
            labelCell.lblTitle.text = formItem.message
            
            labelCell.isHidden = formItem.hidden
            
            return labelCell
            
        case itemType.checkbox.rawValue:
            let checkCell = tableView.dequeueReusableCell(withIdentifier: "check_cell", for: indexPath) as! CheckCell
            
            // Margem do topo
            checkCell.topConstraint.constant = CGFloat(formItem.topSpacing)
            // Popular label
            checkCell.lblMessage.text = formItem.message
            // Personalizar checkbox
            checkCell.chkBox._IBStateChangeAnimation = M13Checkbox.AnimationStyle.fill.rawValue

            checkCell.isHidden = formItem.hidden
            
            return checkCell
            
        case itemType.send.rawValue:
            let buttonCell = tableView.dequeueReusableCell(withIdentifier: "button_cell", for: indexPath) as! ButtonCell
            
            // Margem do topo
            buttonCell.topConstraint.constant = CGFloat(formItem.topSpacing)
            // Popular titulo do botão
            buttonCell.btnSend.titleString = formItem.message
            
            buttonCell.isHidden = formItem.hidden
            
            return buttonCell
            
        default:
            let textFieldCell = tableView.dequeueReusableCell(withIdentifier: "text_field_cell", for: indexPath) as! CustomTextFieldCell
            
            // Margem do topo
            textFieldCell.topConstraint.constant = CGFloat(formItem.topSpacing)
            // Placeholder (floating label)
            textFieldCell.txtField.placeholder = formItem.message
            
            textFieldCell.isHidden = formItem.hidden
            
            return textFieldCell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCell.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

class ListCellViewController: UIViewController, ListCellViewControllerInput, UITableViewDelegate {
    
    var output: ListCellViewControllerOutput!
    var router: ListCellRouter!
    
    // Lista de itens
    var listCell : [Cell] = [Cell]()
    
    // UI
    @IBOutlet weak var tblForm: UITableView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        ListCellConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        // Delegate
        self.tblForm.delegate = self
        self.tblForm.dataSource = self
        
        // Registrar as cells
        let nibTextFieldCell = UINib(nibName: "CustomTextFieldCell", bundle: nil)
        let nibLabelCell = UINib(nibName: "LabelCell", bundle: nil)
        let nibCheckCell = UINib(nibName: "CheckCell", bundle: nil)
        let nibButtonCell = UINib(nibName: "ButtonCell", bundle: nil)
        
        self.tblForm.register(nibTextFieldCell, forCellReuseIdentifier: "text_field_cell")
        self.tblForm.register(nibLabelCell, forCellReuseIdentifier: "label_cell")
        self.tblForm.register(nibCheckCell, forCellReuseIdentifier: "check_cell")
        self.tblForm.register(nibButtonCell, forCellReuseIdentifier: "button_cell")
        
        output.fetchItems()
    }
    
    // Métodos de callback das requisições
    func successFetchedItems(response: ListCell.Fetch.Response) {
        listCell = response.cells
        // Recarregar os dados da tabela
        self.tblForm.reloadData()
    }
    
    func errorFetchingItems(response: ListCell.Fetch.Response) {
        //
    }
}
