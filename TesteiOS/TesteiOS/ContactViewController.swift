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


class ContactViewController: UIViewController, UITextFieldDelegate {
    
    let URL = "https://floating-mountain-50292.herokuapp.com/cells.json"
    let contactDataModel = ContactDataModel()
    
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
        
        getData(url: URL)
        
        sucessView.isHidden = true
        
        // runtime selector to trigger th end editing text field delegate methods
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundViewTapped))
        backgroundView.addGestureRecognizer(tapGesture)

    }

    @objc func backgroundViewTapped() {
        nameTextField.endEditing(true)
        mailTextField.endEditing(true)
        phoneTextField.endEditing(true)
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var fullString = textField.text ?? ""
        fullString.append(string)
        
        if range.length == 1 {
            textField.text = format(phoneNumber: fullString, shouldRemoveLastDigit: true)
        } else {
            textField.text = format(phoneNumber: fullString)
        }
        return false
    }
    
    
    func format(phoneNumber: String, shouldRemoveLastDigit: Bool = false) -> String {
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
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(textField.tag)
        // editing name
        if (textField.tag == 1) {
            nameLabel.font = nameLabel.font.withSize(14)
            nameLine.lineColor = UIColor.red
            nameLine.setNeedsDisplay()
        }
        // editing mail
        else if (textField.tag == 2) {
            emailLabel.font = emailLabel.font.withSize(14)
            mailLine.lineColor = UIColor.gray
            mailLine.setNeedsDisplay()

        }
        // editing phone
        else if (textField.tag == 3) {
            phoneLabel.font = phoneLabel.font.withSize(14)
            phoneLine.lineColor = UIColor.gray
            phoneLine.setNeedsDisplay()
        }
    
    
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // Use that method to validate the current text.
        resignFirstResponder()

        return true
    }
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("clear")
        return true
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return")
        resignFirstResponder()

        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.tag)
        // editing name
        if (textField.tag == 1) {
            nameLabel.font = nameLabel.font.withSize(17)
        }
            // editing mail
        else if (textField.tag == 2) {
            emailLabel.font = emailLabel.font.withSize(17)
            
        }
            // editing phone
        else if (textField.tag == 3) {
            phoneLabel.font = phoneLabel.font.withSize(17)
        }
    }
    
    
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
        //self.view.isHidden = true
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
            }
        }
    }
    
    
    
    //MARK: - JSON parsing
    /*********************************************************************/
    func updateData(json: JSON) {
        
        contactDataModel.name = json["cells"][1]["message"].stringValue
        contactDataModel.email = json["cells"][2]["message"].stringValue
        contactDataModel.phone = json["cells"][3]["message"].stringValue
        contactDataModel.registerEmailTextButton = json["cells"][4]["message"].stringValue
        contactDataModel.sendTextButton = json["cells"][5]["message"].stringValue
        
        updateUIWithData()
        
    }
    
    
    //MARK: - UI Updates
    /*********************************************************************/
    func updateUIWithData() {
        
        nameLabel.text = contactDataModel.name
        emailLabel.text = contactDataModel.email
        phoneLabel.text = contactDataModel.phone
        textButtonLabel.text = contactDataModel.registerEmailTextButton
        sendButton.titleLabel!.text = contactDataModel.sendTextButton

    }
    
    

}

