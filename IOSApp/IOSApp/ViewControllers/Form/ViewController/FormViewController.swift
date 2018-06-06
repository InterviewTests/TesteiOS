//
//  FormViewController.swift
//  IOSApp
//
//  Created by Ana Beatriz Delavia Thomasi on 27/05/2018.
//  Copyright © 2018 Ana Beatriz Delavia Thomasi. All rights reserved.
//

import SkyFloatingLabelTextField
import UIKit

class FormViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate {

    final let formURL = URL(string: "https://floating-mountain-50292.herokuapp.com/cells.json")
    var cells : FormDataModel? = nil
    
    @IBOutlet weak var formTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.formTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.formTableView.rowHeight = UITableViewAutomaticDimension
        self.formTableView.estimatedRowHeight = 20.0
        
        downloadJson { (cells) in
            self.cells = cells
            DispatchQueue.main.async {
                self.formTableView.reloadData()
            }
        }
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    func downloadJson(onComplete: @escaping (FormDataModel) -> Void) {
        guard let downloadURL = formURL else {return}
        URLSession.shared.dataTask(with: downloadURL) {data, urlResponse, error in
            if error == nil {
                guard let urlResponse = urlResponse as? HTTPURLResponse else {return}
                if urlResponse.statusCode == 200 {
                    guard let data = data else {return}
                    
                    do {
                        let decoder = JSONDecoder()
                        let downloadedScreen = try decoder.decode(FormDataModel.self, from: data)
                        onComplete(downloadedScreen)
                    } catch{
                        print("something wrong after downloading")
                    }
                } else {return}
            } else {return}
            }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cells != nil {
            return (cells?.cells.count)!
        } else {
            return 0
        }
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (cells?.cells[indexPath.row].type == Cell.CellTypes.text.rawValue){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell") as? TextTableViewCell else {return
                UITableViewCell()}
            
            cell.tag = cells!.cells[indexPath.row].id
            cell.formTextLbl.text = cells?.cells[indexPath.row].message
            
            cell.isHidden = cells!.cells[indexPath.row].hidden
            cell.selectionStyle = .none
            return cell
        }
        else if (cells?.cells[indexPath.row].type == Cell.CellTypes.checkbox.rawValue){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CheckboxTableViewCell") as? CheckboxTableViewCell else {return
                UITableViewCell()}
            
            cell.tag = cells!.cells[indexPath.row].id
            cell.checboxLbl.text = cells?.cells[indexPath.row].message
            
            cell.isHidden = cells!.cells[indexPath.row].hidden
            cell.selectionStyle = .none
            return cell
        }
        else if (cells?.cells[indexPath.row].type == Cell.CellTypes.image.rawValue){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell") as? ImageTableViewCell else {return
                UITableViewCell()}
            
            cell.tag = cells!.cells[indexPath.row].id
            
            cell.isHidden = cells!.cells[indexPath.row].hidden
            cell.selectionStyle = .none
            return cell
        }
        else if (cells?.cells[indexPath.row].type == Cell.CellTypes.field.rawValue){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FieldTableViewCell") as? FieldTableViewCell else {return
                UITableViewCell()}
            
            cell.tag = cells!.cells[indexPath.row].id
            
            let grayColor = UIColor(red:0.67, green:0.67, blue:0.67, alpha:1.0)
            
            cell.textField.placeholder = cells?.cells[indexPath.row].message
            cell.textField.title = cells?.cells[indexPath.row].message
            cell.textField.tintColor = grayColor
            cell.textField.lineColor = grayColor
            cell.textField.selectedTitleColor = grayColor
            cell.textField.selectedLineColor = grayColor
            cell.textField.delegate = self
            
            //Keyboard Type
            if (cells?.cells[indexPath.row].typefield == Cell.CellTypeField.text.rawValue){
                cell.textField.keyboardType = UIKeyboardType.alphabet
            }
            else if (cells?.cells[indexPath.row].typefield == Cell.CellTypeField.email.rawValue){
                cell.textField.keyboardType = UIKeyboardType.emailAddress
            }
            else if (cells?.cells[indexPath.row].typefield == Cell.CellTypeField.telNumberInt.rawValue || cells?.cells[indexPath.row].typefield == Cell.CellTypeField.telNumberStr.rawValue){
                cell.textField.keyboardType = UIKeyboardType.numberPad
            }
            
            cell.isHidden = cells!.cells[indexPath.row].hidden
            cell.selectionStyle = .none
            return cell
        }
        else if (cells?.cells[indexPath.row].type == Cell.CellTypes.send.rawValue){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell") as? ButtonTableViewCell else {return
                UITableViewCell()}
            
            cell.tag = cells!.cells[indexPath.row].id
            cell.sendBtn.setTitle(cells?.cells[indexPath.row].message, for: .normal)
        
            cell.isHidden = cells!.cells[indexPath.row].hidden
            cell.selectionStyle = .none
            return cell
        }
        
        
      return UITableViewCell()
    }
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

    
    @IBAction func textFieldChanged(_ sender: SkyFloatingLabelTextField) {
        if let text = sender.text {
            if (sender.keyboardType == UIKeyboardType.alphabet){
                if (isValidName(value: text)){
                    sender.errorMessage = ""
                    sender.lineColor = UIColor(red:0.02, green:0.91, blue:0.46, alpha:1.0)
                } else {
                    sender.errorMessage = "Nome Inválido"
                }
            } else if (sender.keyboardType == UIKeyboardType.emailAddress){
                if (isValidEmail(value: text)){
                    sender.errorMessage = ""
                    sender.lineColor = UIColor(red:0.02, green:0.91, blue:0.46, alpha:1.0)
                } else {
                    sender.errorMessage = "Email Inválido"
                }
            } else if (sender.keyboardType == UIKeyboardType.numberPad){
                if (isValidPhone(value: text)){
                    sender.errorMessage = ""
                    sender.lineColor = UIColor(red:0.02, green:0.91, blue:0.46, alpha:1.0)
                } else {
                    sender.errorMessage = "Telefone Inválido"
                }
            }
        }
    }
    
    func isValidName(value: String) -> Bool {
        return !value.isEmpty
    }
    
    func isValidEmail(value:String) -> Bool {
        let EMAIL_REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", EMAIL_REGEX)
        return emailTest.evaluate(with: value)
    }
    
    func isValidPhone(value: String) -> Bool {
        return true
        let PHONE_REGEX = "^\\((\\d{2})\\)\\s(\\d{4,5}\\-\\d{4})$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        return phoneTest.evaluate(with: value)
    }
    
    @IBAction func checkBoxWasPressed(_ sender: CheckBox) {
        let toggleView = formTableView.viewWithTag(4)
        
        if (!sender.isChecked){
            toggleView?.isHidden = false
        } else {
            toggleView?.isHidden = true
        }
    }
    
    @IBAction func sendBtnWasPressed(_ sender: UIButton) {
        sender.animateButton()
        
        var success = true
        
        for i in 2...7 where i % 2 == 0 {
            let textFieldCell = formTableView.viewWithTag(i) as! FieldTableViewCell
            if (!textFieldCell.isHidden){
                let textField = textFieldCell.textField as SkyFloatingLabelTextField
                textFieldChanged(textField)
                if (textField.errorMessage != nil && !textField.errorMessage!.isEmpty){
                    success = false
                }
            }
        }
        
        if (success){
            performSegue(withIdentifier: "successSegue", sender: sender)
        } else {
            //do nothing
        }
        
    }
    @objc func dismissKeyboard() {
        
        formTableView.endEditing(true)
    }
}
