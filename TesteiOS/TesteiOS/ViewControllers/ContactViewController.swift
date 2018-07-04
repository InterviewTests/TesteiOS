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
    var namePosition = Int()
    var telNumberPosition = Int()
    var emailPosition = Int()
    var registerEmailPosition = Int()
    var sendPosition = Int()
    
    
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

        // set text fields delegates
        nameTextField.delegate = self
        mailTextField.delegate = self
        phoneTextField.delegate = self
        
        // get data from specified URL
        getData(url: URL)
        
        // this view is hidden until user sucessfully fills the form
        sucessView.isHidden = true
        
        // runtime selector to trigger the end-editing text field delegate methods when user taps outside the text field
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundViewTapped))
        backgroundView.addGestureRecognizer(tapGesture)

    }

    
    
    //MARK: - TextField Delegate Methods
    /*********************************************************************/
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")

        nameTextField.clearButtonMode = .whileEditing
        mailTextField.clearButtonMode = .whileEditing
        phoneTextField.clearButtonMode = .whileEditing

        adjustTextFieldUIWhileEditing(textField: textField, mode: .reduced)
    }
    

    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")

       adjustTextFieldUIWhileEditing(textField: textField, mode: .normal)
    }

    
    // called whenever the user types a char
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("textField")
        
        // name text field
        if textField.tag == 1 {
            
            var fullString = textField.text ?? ""
            fullString.append(string)
            
            print("fullString: \(fullString)")
            print("textfield: \(textField.text!)")

            
            let response = Validation.shared.validate(type: ValidationType.name, inputValue: fullString)
            print(fullString)

            switch response {
            case .success:
                nameLine.lineColor = UIColor.green
                nameLine.setNeedsDisplay()
            case .failure:
                nameLine.lineColor = UIColor.red
                nameLine.setNeedsDisplay()
            }
        }
            
        // mail text field
        else if textField.tag == 2 {
            
            var fullString = textField.text ?? ""
            fullString.append(string)
            
            print("fullString: \(fullString)")
            print("textfield: \(textField.text!)")
            
            let response = Validation.shared.validate(type: ValidationType.email, inputValue: fullString)
            print(fullString)

            switch response {
            case .success:
                print("data ok")
                mailLine.lineColor = UIColor.green
                mailLine.setNeedsDisplay()
            case .failure:
                mailLine.lineColor = UIColor.red
                mailLine.setNeedsDisplay()
            }
        }
            
        // format phone number
        else if textField.tag == 3 {
            var fullString = textField.text ?? ""
            fullString.append(string)
            
            // empty string
            if range.length == 1 {
                textField.text = format(phoneNumber: fullString, shouldRemoveLastDigit: true)
                print("fullString: \(fullString)")
                print("textfield: \(textField.text!)")
                
            } else {
                textField.text = format(phoneNumber: fullString)
                print("fullString: \(fullString)")
                print("textfield: \(textField.text!)")
                
            }

            let response = Validation.shared.validate(type: ValidationType.phoneNumber, inputValue: textField.text!)
            
            switch response {
            case .success:
                print("data ok")
                phoneLine.lineColor = UIColor.green
                phoneLine.setNeedsDisplay()
            case .failure:
                phoneLine.lineColor = UIColor.red
                phoneLine.setNeedsDisplay()
            }
            return false
        }
        return true
    }
    
    
    // return false in cases where delegate detects invalid contents in the text field
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing")
        // editing name
        if (textField.tag == 1) {
            let response = Validation.shared.validate(type: ValidationType.name, inputValue: textField.text!)
        
            
            switch response {
            case .success:
                print("data ok")
                nameLine.lineColor = UIColor.green
                nameLine.setNeedsDisplay()
                
                break
            case .failure:
                nameLine.lineColor = UIColor.red
                nameLine.setNeedsDisplay()
                return false
            }
        }
            // editing mail
        else if (textField.tag == 2) {
            let response = Validation.shared.validate(type: ValidationType.email, inputValue: textField.text!)
            
            switch response {
            case .success:
                print("data ok")
                mailLine.lineColor = UIColor.green
                mailLine.setNeedsDisplay()
                break
            case .failure:
                mailLine.lineColor = UIColor.red
                mailLine.setNeedsDisplay()
                return false
            }
            
        }
            // editing phone
        else if (textField.tag == 3) {
            let response = Validation.shared.validate(type: ValidationType.phoneNumber, inputValue: textField.text!)
            
            switch response {
            case .success:
                print("data ok")
                phoneLine.lineColor = UIColor.green
                phoneLine.setNeedsDisplay()
                break
            case .failure:
                phoneLine.lineColor = UIColor.red
                phoneLine.setNeedsDisplay()
                return false
            }
        }
        
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.endEditing(true)
        
        return true
    }

    
    //MARK: - IBActions Methods
    /*********************************************************************/

    @IBAction func sendButtonPressed(_ sender: UIButton) {
        sucessView.isHidden = false
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
                print("Reponse: \(response)")
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
    
    private func adjustTextFieldUIWhileEditing (textField : UITextField, mode : TextFieldEditingModeType) {
        
        var fontSize = CGFloat()
        
        mode == .reduced ? (fontSize = 14.0) : (fontSize = 17.0)
        
        // editing name
        if (textField.tag == 1) {
            nameLabel.font = nameLabel.font.withSize(fontSize)
            nameLine.lineColor = UIColor.gray
            nameLine.setNeedsDisplay()
        }
            // editing mail
        else if (textField.tag == 2) {
            emailLabel.font = emailLabel.font.withSize(fontSize)
            mailLine.lineColor = UIColor.gray
            mailLine.setNeedsDisplay()
            
        }
            // editing phone
        else if (textField.tag == 3) {
            phoneLabel.font = phoneLabel.font.withSize(fontSize)
            phoneLine.lineColor = UIColor.gray
            phoneLine.setNeedsDisplay()
            
        }
    }
    
    
    @objc private func backgroundViewTapped() {
        print("backgroundViewTapped")
        nameTextField.endEditing(true)
        mailTextField.endEditing(true)
        phoneTextField.endEditing(true)
        
    }
    
    
    private func format(phoneNumber: String, shouldRemoveLastDigit: Bool = false) -> String {
        print("format")
        
        
        guard !phoneNumber.isEmpty else { return "" }
        guard let regex = try? NSRegularExpression(pattern: "[\\s-\\(\\)]", options: .caseInsensitive) else { return "" }
        let r = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regex.stringByReplacingMatches(in: phoneNumber, options: .init(rawValue: 0), range: r, withTemplate: "")
        
        // max 11 numbers
        if number.count > 11 {
            let eleventhDigitIndex = number.index(number.startIndex, offsetBy: 11)
            number = String(number[number.startIndex..<eleventhDigitIndex])
        }
        
        if shouldRemoveLastDigit {
            let end = number.index(number.startIndex, offsetBy: number.count-1)
            number = String(number[number.startIndex..<end])
        }
        
        if number.count < 7 {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{2})(\\d+)", with: "($1) $2", options: .regularExpression, range: range)
            
        } else if number.count < 11 {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{2})(\\d{4})(\\d+)", with: "($1) $2-$3", options: .regularExpression, range: range)
        } else {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{2})(\\d{5})(\\d+)", with: "($1) $2-$3", options: .regularExpression, range: range)
        }
        
        return number
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

