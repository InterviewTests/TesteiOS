//
//  ViewController.swift
//  TesteiOS
//
//  Created by Carolina Bonturi on 6/16/18.
//  Copyright © 2018 Carolina Bonturi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


enum TextFieldEditingModeType {
    case normal
    case reduced
}


class ContactViewController: UIViewController, UITextFieldDelegate {
    
    // URL constant
    let URL = "https://floating-mountain-50292.herokuapp.com/cells.json"
    
    // variables to handle Json data
    var cells = [Cell]()
    
    var nameItem = FormItem()
    var emailItem = FormItem()
    var phoneItem = FormItem()
    
    var namePosition = Int()
    var telNumberPosition = Int()
    var emailPosition = Int()
    var registerEmailPosition = Int()
    var sendPosition = Int()
    
    // outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLine: Line!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var mailLine: Line!
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var phoneLine: Line!
    
    @IBOutlet weak var textButtonLabel: UILabel!
    @IBOutlet weak var sendButton: CustomButton!
    @IBOutlet weak var sucessView: UIView!

    @IBOutlet weak var backgroundView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set textfields delegates
        nameTextField.delegate = self
        mailTextField.delegate = self
        phoneTextField.delegate = self
        
        // populate labels with data
        getData(url: URL)
        
        // this view is hidden until user sucessfully fills the form
        sucessView.isHidden = true
        
        // runtime selector to trigger the end-editing text field delegate methods when user taps outside the text field
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundViewTapped))
        backgroundView.addGestureRecognizer(tapGesture)
        
        populateFormItems()
    }

    
    //MARK: - TextField Delegate Methods
    /*********************************************************************/
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

        nameTextField.clearButtonMode = .whileEditing
        mailTextField.clearButtonMode = .whileEditing
        phoneTextField.clearButtonMode = .whileEditing

        adjustTextFieldUIWhileEditing(textField: textField, mode: .reduced)
    }
    

    func textFieldDidEndEditing(_ textField: UITextField) {
       adjustTextFieldUIWhileEditing(textField: textField, mode: .normal)
    }

    
    // called whenever the user types a char
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // validate field and updateUI accordingly
        var fullString = textField.text ?? ""
        fullString.append(string)

        if (textField == nameItem.textField) {
           let response = Validation.shared.validate(type: .name, inputValue: fullString)
            updateFormItem(response: response, type: .name)
        }
        else if (textField == emailItem.textField) {
            let response = Validation.shared.validate(type: .email, inputValue: fullString)
            updateFormItem(response: response, type: .email)
        }
        else if (textField == phoneItem.textField) {
            // backspace pressed (char erased)
            if range.length == 1 {
                textField.text = Format.shared.format(phoneNumber: fullString, shouldRemoveLastDigit: true)
            } else {
                textField.text = Format.shared.format(phoneNumber: fullString)
            }
            
            fullString = textField.text!
            let response = Validation.shared.validate(type: .phoneNumber, inputValue: fullString)
            updateFormItem(response: response, type: .phoneNumber)
            
            // return false to not duplicate characters (keep the old text)
            return false
        }
        // return true to print the character typed (text range should be replaced)
        return true
    }

    
    // return false in cases where delegate detects invalid contents in the text field
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if (textField == nameItem.textField) {
            let response = Validation.shared.validate(type: .name, inputValue: textField.text!)
            updateFormItem(response: response, type: .name)
        }
        else if (textField == emailItem.textField) {
            let response = Validation.shared.validate(type: .email, inputValue: textField.text!)
            updateFormItem(response: response, type: .email)
        }
        else if (textField == phoneItem.textField) {
            let response = Validation.shared.validate(type: .phoneNumber, inputValue: textField.text!)
            updateFormItem(response: response, type: .phoneNumber)
        }
        return true
    }
    
    
    // return button pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }

    
    //MARK: - IBActions Methods
    /*********************************************************************/

    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
        let response1 = Validation.shared.validate(type: .name, inputValue: nameTextField.text!)
        let response2 = Validation.shared.validate(type: .email, inputValue: mailTextField.text!)
        let response3 = Validation.shared.validate(type: .phoneNumber, inputValue: phoneTextField.text!)
        
        if (response1 == .success && response2 == .success && response3 == .success) {
            sucessView.isHidden = false
        }
        
        sender.setTitle(cells[sendPosition].message, for: .normal)
    }
    
    @IBAction func newMessageButtonPressed(_ sender: UIButton) {
        sucessView.isHidden = true
        updateUIWithData()
    }
    
    
    //MARK: - Networking
    /*********************************************************************/
    func getData(url: String) {
        
        // retrieve data from an HTTP request
        Alamofire.request(url, method: .get).responseJSON {
            // once the response comes back
            response in
            if response.result.isSuccess {
                let dataJSON : JSON = JSON(response.result.value!)
                self.updateData(json: dataJSON)
            }
            // if it did not manage to get the data
            else {
                print("Error: \(response.result.error!)")
            }
        }
    }
    
    
    //MARK: - JSON parsing
    /*********************************************************************/
    func updateData(json: JSON) {
        
        for item in 0..<json["cells"].count {
            
            let newCell = Cell()
            
            newCell.id = json["cells"][item]["id"].intValue
            newCell.type = Type(rawValue: json["cells"][item]["type"].intValue)
            newCell.message = json["cells"][item]["message"].stringValue
            newCell.typefield = TypeField(rawValue: json["cells"][item]["typefield"].intValue)
            newCell.hidden = json["cells"][item]["hidden"].boolValue
            newCell.topSpacing = json["cells"][item]["topSpacing"].doubleValue
            newCell.show = json["cells"][item]["show"].intValue
            newCell.required = json["cells"][item]["required"].boolValue
            
            cells.append(newCell)
        }
        updateUIWithData()
    }
    
    
    //MARK: - UI Updates
    /*********************************************************************/
    func updateUIWithData() {
        
        namePosition = lookFor(key: "name", array: cells)!
        emailPosition = lookFor(key: "email", array: cells)!
        //telNumberPosition = lookFor(key: "telNumber", array: cells)! JSON file non compliant with typefield specification
        registerEmailPosition = lookFor(key: "registerEmail", array: cells)!
        sendPosition = lookFor(key: "send", array: cells)!

        nameLabel.text = cells[namePosition].message
        emailLabel.text = cells[emailPosition].message
        phoneLabel.text = cells[3].message
        textButtonLabel.text = cells[registerEmailPosition].message
        sendButton.titleLabel!.text = cells[sendPosition].message
        
    }
    
    
    //MARK: - Helper Methods
    /*********************************************************************/
    func populateFormItems() {
        nameItem.id  = ValidationType.name
        nameItem.label = nameLabel
        nameItem.textField = nameTextField
        nameItem.line = nameLine
        
        emailItem.id  = ValidationType.email
        emailItem.label = emailLabel
        emailItem.textField = mailTextField
        emailItem.line = mailLine
        
        phoneItem.id  = ValidationType.phoneNumber
        phoneItem.label = phoneLabel
        phoneItem.textField = phoneTextField
        phoneItem.line = phoneLine
    }
    
    
    private func updateFormItem(response: Valid, type: ValidationType){
        switch response {
        case .success:
            if (type == .name) {
                nameItem.line.lineColor = UIColor.green
                nameItem.line.setNeedsDisplay()
            } else if (type == .email) {
                emailItem.line.lineColor = UIColor.green
                emailItem.line.setNeedsDisplay()
            } else if (type == .phoneNumber) {
                phoneItem.line.lineColor = UIColor.green
                phoneItem.line.setNeedsDisplay()
            }
        case .failure:
            if (type == .name) {
                nameItem.line.lineColor = UIColor.red
                nameItem.line.setNeedsDisplay()
            } else if (type == .email) {
                emailItem.line.lineColor = UIColor.red
                emailItem.line.setNeedsDisplay()
            } else if (type == .phoneNumber) {
                phoneItem.line.lineColor = UIColor.red
                phoneItem.line.setNeedsDisplay()
            }
        }
    }
    
    
    private func adjustTextFieldUIWhileEditing (textField : UITextField, mode : TextFieldEditingModeType) {
        var fontSize = CGFloat()
        mode == .reduced ? (fontSize = 14.0) : (fontSize = 17.0)
        
        if (textField == nameItem.textField) {
            nameItem.label.font = nameItem.label.font.withSize(fontSize)
            nameItem.line.lineColor = UIColor.gray
            nameItem.line.setNeedsDisplay()
        }
        else if (textField == emailItem.textField) {
            emailItem.label.font = emailItem.label.font.withSize(fontSize)
            emailItem.line.lineColor = UIColor.gray
            emailItem.line.setNeedsDisplay()
        }
        else if (textField == phoneItem.textField) {
            phoneItem.label.font = phoneItem.label.font.withSize(fontSize)
            phoneItem.line.lineColor = UIColor.gray
            phoneItem.line.setNeedsDisplay()
        }
    }
    
    
    @objc private func backgroundViewTapped() {
        nameItem.textField.endEditing(true)
        emailItem.textField.endEditing(true)
        phoneItem.textField.endEditing(true)
    }
    
    
    private func lookFor(key: String, array: [Cell]) -> Int? {
        
        let size = array.count
        var dict : [String : Int] = ["name" : 1, "telNumber": 2, "email" : 3, "registerEmail": 4, "send": 5]
        
        for item in 0..<size {
            if ((array[item].typefield?.rawValue == dict[key]) || (array[item].type?.rawValue == dict[key])) {
                return item
            }
        }
        return nil
    }
}

