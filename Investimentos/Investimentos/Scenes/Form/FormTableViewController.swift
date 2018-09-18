//
//  FormTableViewController.swift
//  Investimentos
//
//  Created by Cmdev on 11/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

class FormTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var cells = Cells()
    
    var registerEmail = true
    
    var emailCell: Cell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CellsAPI.getAllFormCells { (cells, success) in
            guard let cells = cells else { return }
            self.cells = cells
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - View action
    @IBAction func sendAction(_ sender: UIButton) {
        //recuperando células que necessitam de validação
        let nameCell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? TextFieldTableViewCell
        let emailCell = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? TextFieldTableViewCell
        let phoneCell = tableView.cellForRow(at: IndexPath(row: registerEmail ? 3 : 2, section: 0)) as? TextFieldTableViewCell
        /*
         > validando apenas se as cores dos campos estão válidas.
         > se sim, apresentar tela de sucesso.
         > se não, mostrar alert de erro.
        */
        if nameCell?.indicator.backgroundColor == #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1) && phoneCell?.indicator.backgroundColor == #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1) {
            if registerEmail {
                if emailCell?.indicator.backgroundColor == #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1) {
                    cleanFields()
                    performSegue(withIdentifier: SeguesIdentifiersNamespaces.SuccessMessageSegue, sender: nil)
                } else {
                    Notices.showAlert(title: "Ops", message: "Por favor, verifique os campos preenchidos.", target: self)
                }
            } else {
                cleanFields()
                performSegue(withIdentifier: SeguesIdentifiersNamespaces.SuccessMessageSegue, sender: nil)
            }
        } else {
            Notices.showAlert(title: "Ops", message: "Por favor, verifique os campos preenchidos.", target: self)
        }
        
    }
    
    //MARK: - Aux actions
    private func cleanFields() {
        //recuperando células
        let nameCell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? TextFieldTableViewCell
        let emailCell = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? TextFieldTableViewCell
        let phoneCell = tableView.cellForRow(at: IndexPath(row: registerEmail ? 3 : 2, section: 0)) as? TextFieldTableViewCell
        
        //limpando texto
        nameCell?.textField.text = ""
        emailCell?.textField.text = ""
        phoneCell?.textField.text = ""
        
        nameCell?.indicator.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        emailCell?.indicator.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        phoneCell?.indicator.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
    }

}



//MARK: - table view datasource e delegate
extension FormTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //caso o usuário desejar registrar seu e-mail, o formulário terá 6 rows, senão terá 5
        return registerEmail ? 6 : 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            //célula de saudações
            let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.PresentationCell, for: indexPath) as? PresentationTableViewCell
            let presentationCell = cells.getCell(identifier: .Presentation)
            cell?.presentationLabel.text = presentationCell?.message
            return cell!
        case 1:
            //célula textfield para nome
            let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.TextFieldCell, for: indexPath) as? TextFieldTableViewCell
            let nameCell = cells.getCell(identifier: .Name)
            cell?.textField.placeholder = nameCell?.message
            cell?.textField.autocapitalizationType = .words
            return cell!
        case 2:
            /*
             > célula textfield para email
             Obs: só irá aparecer caso o usuário decide registrar seu e-mail no contato
            */
            if registerEmail {
                let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.TextFieldCell, for: indexPath) as? TextFieldTableViewCell
                let emailCell = cells.getCell(identifier: .Email)
                cell?.textField.placeholder = emailCell?.message
                cell?.textField.keyboardType = .emailAddress
                cell?.textField.autocapitalizationType = .none
                cell?.textField.autocorrectionType = .no
                return cell!
            }
            return UITableViewCell()
        case 3:
            //célula textfield para telefone
            let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.TextFieldCell, for: indexPath) as? TextFieldTableViewCell
            let phoneCell = cells.getCell(identifier: .Phone)
            cell?.textField.placeholder = phoneCell?.message
            cell?.textField.keyboardType = .phonePad
            return cell!
        case 4:
            /*
             > célula checkbox indicando se o usuário deseja enviar seu endereço de e-mail ou não.
             > dependendo da opção escolhida pelo usuário, a célula de e-mail deve ser removida ou não.
            */
            let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.RegisterEmailCell, for: indexPath) as? RegisterEmailTableViewCell
            let registerEmailCell = cells.getCell(identifier: .RegisterEmail)
            cell?.registerEmailLabel.text = registerEmailCell?.message
            cell?.switched = { (isOn) in
                self.registerEmail = isOn
                tableView.beginUpdates()
                if isOn {
                    self.cells.cells.insert(self.emailCell!, at: 2)
                    tableView.insertRows(at: [IndexPath(row: 2, section: 0)], with: UITableViewRowAnimation.fade)
                } else {
                    self.emailCell = self.cells.cells[2]
                    self.cells.cells.remove(at: 2)
                    tableView.deleteRows(at: [IndexPath(row: 2, section: 0)], with: UITableViewRowAnimation.fade)
                }
                tableView.endUpdates()
            }
            return cell!
        case (cells.cells.count-1):
            //célula button Enviar
            let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.SendButtonCell, for: indexPath) as? SendButtonTableViewCell
            let sendButtonCell = cells.getCell(identifier: .Send)
            cell?.sendButton.setTitle(sendButtonCell?.message, for: .normal)
            return cell!
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0, 1, 2:
            return 65.0
        default:
            return 55.0
        }
    }
}



extension FormTableViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //Validando e-mail
        if textField.keyboardType == .emailAddress {
            //pegar célula responsável pelo e-mail
            let cell = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? TextFieldTableViewCell
            //alterando cor do indicador
            if Validators.isValidEmail(testStr: textField.text!) {
                cell?.indicator.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            } else {
                cell?.indicator.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            }
        }
        //Aplicando máscara e verificando número de telefone
        else if textField.keyboardType == .phonePad {
            //identificando o backspace
            let  char = string.cString(using: String.Encoding.utf8)!
            let isBackSpace = strcmp(char, "\\b")
            
            //alterando cor do indicador
            let cell = tableView.cellForRow(at: IndexPath(row: registerEmail ? 3 : 2, section: 0)) as? TextFieldTableViewCell
            if textField.text!.count + string.count - range.length > 13 {
                cell?.indicator.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            } else {
                cell?.indicator.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            }
            
            //formatando texto
            let phone = Masks.formattedNumber(number: textField.text! + string)
            textField.text = phone
            
            //verificando se o backspace foi selecionado
            if (isBackSpace == -92) {
                return true
            }
            
            return false
        }
        //Validando nome completo
        else if textField.autocapitalizationType == .words {
            //Verificando apenas se quantidade de caracteres é maior que zero
            let cell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? TextFieldTableViewCell
            if textField.text!.count + string.count - range.length > 0 {
                cell?.indicator.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            } else {
                cell?.indicator.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            }
        }
        return true
    }
}
