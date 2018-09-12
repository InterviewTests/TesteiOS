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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}




extension FormTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.PresentationCell, for: indexPath) as? PresentationTableViewCell
            let presentationCell = cells.getCell(identifier: .Presentation)
            cell?.presentationLabel.text = presentationCell?.message
            return cell!
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.TextFieldCell, for: indexPath) as? TextFieldTableViewCell
            let nameCell = cells.getCell(identifier: .Name)
            cell?.textField.placeholder = nameCell?.message
            cell?.textField.autocapitalizationType = .words
            return cell!
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.TextFieldCell, for: indexPath) as? TextFieldTableViewCell
            let emailCell = cells.getCell(identifier: .Email)
            cell?.textField.placeholder = emailCell?.message
            cell?.textField.keyboardType = .emailAddress
            cell?.textField.autocapitalizationType = .none
            cell?.textField.autocorrectionType = .no
            return cell!
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.TextFieldCell, for: indexPath) as? TextFieldTableViewCell
            let phoneCell = cells.getCell(identifier: .Phone)
            cell?.textField.placeholder = phoneCell?.message
            cell?.textField.keyboardType = .phonePad
            return cell!
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.RegisterEmailCell, for: indexPath) as? RegisterEmailTableViewCell
            let registerEmailCell = cells.getCell(identifier: .RegisterEmail)
            cell?.registerEmailLabel.text = registerEmailCell?.message
            return cell!
        case 5:
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
            //verificando se o backspace foi selecionado
            let  char = string.cString(using: String.Encoding.utf8)!
            let isBackSpace = strcmp(char, "\\b")
            
            //alterando cor do indicador
            let cell = tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as? TextFieldTableViewCell
            if textField.text!.count + string.count - range.length > 13 {
                cell?.indicator.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            } else {
                cell?.indicator.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            }
            
            //formatando texto
            let phone = Masks.formattedNumber(number: textField.text! + string)
            textField.text = phone
            
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
