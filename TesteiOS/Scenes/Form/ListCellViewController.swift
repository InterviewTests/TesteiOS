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

// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

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

enum typeField : String {
    case text = "1"
    case telNumber = "telnumber"
    case email = "3"
}

// Protocol ButtonCell
extension ListCellViewController : ButtonCellDelegate, SuccessViewDelegate {
    func btnSendNewMessageTapped(_ tag: Int) {
        self.successView.removeFromSuperview()
    }
    
    func btnSendTapped(_ tag: Int) {
        if validateForm() {
            self.successView.center = self.centerPosition
            self.successView.successViewDelegate = self
            self.successView.tag = tag
            self.tblForm.addSubview(successView)
        }
    }
}

// Protocol CheckCell
extension ListCellViewController : CheckCellDelegate {
    func chkBoxChanged(_ tag: Int, _ checkState: M13Checkbox.CheckState) {
        
        let formItem = listCell.first(where: { $0.id == tag })
        // Alterar visibilidade do item no array
        formItem?.hidden = (checkState.rawValue == "Checked" ? false : true)
        // Obter indexPath
        let idxPath = IndexPath(row: listCell.index(where: { $0.id == formItem?.id })!, section: 0)
        // Recarregar somente a linha alterada (performance)
        tblForm.reloadRows(at: [idxPath], with: .automatic)
    }
}

// Tableview
extension ListCellViewController : UITableViewDataSource {

    // Métodos da tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let formItem = listCell[indexPath.row]
        
        // Tratar os tipos de celulas
        switch formItem.type {
        case itemType.field.rawValue:
            let textFieldCell = tableView.dequeueReusableCell(withIdentifier: "text_field_cell", for: indexPath) as! CustomTextFieldCell
            
            // Popular os campos
            textFieldCell.topConstraint.constant = CGFloat(formItem.topSpacing)
            textFieldCell.txtField.placeholder = formItem.message
            textFieldCell.isHidden = formItem.hidden
            
            // Tipo do campo (text, email ou telNumber)
            switch formItem.typefield {
                case typeField.email.rawValue:
                    textFieldCell.txtField.keyboardType = .emailAddress
                case typeField.text.rawValue:
                    textFieldCell.txtField.keyboardType = .alphabet
                case typeField.telNumber.rawValue:
                    textFieldCell.txtField.keyboardType = .phonePad
                default:
                    break
            }
            
            return textFieldCell
            
        case itemType.text.rawValue:
            let labelCell = tableView.dequeueReusableCell(withIdentifier: "label_cell", for: indexPath) as! LabelCell
            
            // Popular os campos
            labelCell.topConstraint.constant = CGFloat(formItem.topSpacing)
            labelCell.lblTitle.text = formItem.message
            labelCell.isHidden = formItem.hidden
            
            return labelCell
            
        case itemType.checkbox.rawValue:
            let checkCell = tableView.dequeueReusableCell(withIdentifier: "check_cell", for: indexPath) as! CheckCell
            
            // Delegate na célula para utilizar os métodos do protocol
            checkCell.chkCellDelegate = self
            
            // Popular os campos
            checkCell.topConstraint.constant = CGFloat(formItem.topSpacing)
            checkCell.lblMessage.text = formItem.message
            checkCell.isHidden = formItem.hidden
            
            // Personalizar checkbox
            checkCell.chkBox._IBStateChangeAnimation = M13Checkbox.AnimationStyle.fill.rawValue
            
            // Atribuir ID do item a propriedade 'tag' do checkBox
            checkCell.chkBox.tag = formItem.show!
            
            return checkCell
            
        case itemType.send.rawValue:
            let buttonCell = tableView.dequeueReusableCell(withIdentifier: "button_cell", for: indexPath) as! ButtonCell
            
            // Popular os campos
            buttonCell.topConstraint.constant = CGFloat(formItem.topSpacing)
            buttonCell.btnSend.titleString = formItem.message
            buttonCell.btnCellDelegate = self
            buttonCell.btnSend.tag = formItem.id
            buttonCell.isHidden = formItem.hidden
            
            return buttonCell
            
        default:
            let textFieldCell = tableView.dequeueReusableCell(withIdentifier: "text_field_cell", for: indexPath) as! CustomTextFieldCell
            
            // Popular os campos
            textFieldCell.topConstraint.constant = CGFloat(formItem.topSpacing)
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
    
    // Definir altura de cada celula
    // Utilizado para esconder celulas do tipo 'hidden'
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let formItem = listCell[indexPath.row]
        
        // Retornar altura 0 para celulas do tipo hidden
        if formItem.hidden {
            return 0
        }
        
        // Obter altura automaticamente
        return UITableViewAutomaticDimension
    }
}

// Controller da tela do formulário
class ListCellViewController: UIViewController, ListCellViewControllerInput, UITableViewDelegate {
    
    var output: ListCellViewControllerOutput!
    var router: ListCellRouter!
    
    // Lista de itens
    var listCell : [Cell] = [Cell]()
    
    // UI
    @IBOutlet weak var tblForm: UITableView!
    var successView = SuccessView()
    var centerPosition : CGPoint = CGPoint(x: 0, y: 0)
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        ListCellConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLayoutSubviews() {
        self.centerPosition = CGPoint(x: (self.tblForm.frame.size.width / 2), y: (self.tblForm.frame.size.height / 2))
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.hideKeyboardWhenTappedAround()
        
        // Delegate
        self.tblForm.delegate = self
        
        // Registrar as cells
        let nibTextFieldCell = UINib(nibName: "CustomTextFieldCell", bundle: nil)
        let nibLabelCell = UINib(nibName: "LabelCell", bundle: nil)
        let nibCheckCell = UINib(nibName: "CheckCell", bundle: nil)
        let nibButtonCell = UINib(nibName: "ButtonCell", bundle: nil)
        
        self.tblForm.register(nibTextFieldCell, forCellReuseIdentifier: "text_field_cell")
        self.tblForm.register(nibLabelCell, forCellReuseIdentifier: "label_cell")
        self.tblForm.register(nibCheckCell, forCellReuseIdentifier: "check_cell")
        self.tblForm.register(nibButtonCell, forCellReuseIdentifier: "button_cell")
        
        // View de sucesso do formulário
        self.successView = UINib(nibName: "SuccessView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! SuccessView
        
        // Buscar itens
        output.fetchItems()
    }
    
    // Métodos de callback das requisições
    func successFetchedItems(response: ListCell.Fetch.Response) {
        listCell = response.cells
        
        self.tblForm.dataSource = self
        
        // Recarregar os dados da tabela
        DispatchQueue.main.async {
            self.tblForm.reloadData()
        }
    }
    
    func errorFetchingItems(response: ListCell.Fetch.Response) {
        //
    }
    
    // Validar o formulário
    func validateForm() -> Bool {
        let tableViewCells = tblForm.visibleCells
        var valid : Bool = true
        
        for cell in tableViewCells {
            if cell.isKind(of: CustomTextFieldCell.self){
                let cell = cell as! CustomTextFieldCell
                
                
                if cell.txtField.hasErrorMessage || cell.txtField.keyboardType != .emailAddress &&  (cell.txtField.text?.isEmpty)! {
                    valid = false
                    return valid
                }
            }
        }
        
        return valid
    }
}
