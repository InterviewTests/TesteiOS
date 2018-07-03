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
        
        // get data from specified URL
        getData(url: URL)
        
        // this view is hidden until user sucessfully fills the form
        sucessView.isHidden = true
        
        // runtime selector to trigger the end-editing text field delegate methods when user taps outside the text field
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundViewTapped))
        backgroundView.addGestureRecognizer(tapGesture)

    }

    
    
    
    //MARK: - TextField Delegate Methods
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")

        // editing name
        if (textField.tag == 1) {
            nameLabel.font = nameLabel.font.withSize(14)
            nameLine.lineColor = UIColor.gray
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

    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")

        print(textField.tag)
        // editing name
        if (textField.tag == 1) {
            nameLabel.font = nameLabel.font.withSize(17)
            
            // TODO: check if data is OK before change line color
            
            nameLine.lineColor = UIColor.gray
            nameLine.setNeedsDisplay()
        }
            // editing mail
        else if (textField.tag == 2) {
            emailLabel.font = emailLabel.font.withSize(17)
            mailLine.lineColor = UIColor.gray
            mailLine.setNeedsDisplay()
            
        }
            // editing phone
        else if (textField.tag == 3) {
            phoneLabel.font = phoneLabel.font.withSize(17)
            phoneLine.lineColor = UIColor.gray
            phoneLine.setNeedsDisplay()
        }
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

            
            let response = Validation.shared.validate(values: (ValidationType.name, fullString))
            print(fullString)

            switch response {
            case .success:
                print("data ok")
                nameLine.lineColor = UIColor.green
                nameLine.setNeedsDisplay()
            case .failure(_, let message):
                print(message.localized())
                nameLine.lineColor = UIColor.red
                nameLine.setNeedsDisplay()
            }
        }
            
        // mail text field
        else if textField.tag == 2 {
            print(textField.text!)
            
            var fullString = textField.text ?? ""
            fullString.append(string)
            
            print("fullString: \(fullString)")
            print("textfield: \(textField.text!)")
            
            let response = Validation.shared.validate(values: (ValidationType.email, fullString))
            print(fullString)

            switch response {
            case .success:
                print("data ok")
                mailLine.lineColor = UIColor.green
                mailLine.setNeedsDisplay()
            case .failure(_, let message):
                print(message.localized())
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

            let response = Validation.shared.validate(values: (ValidationType.phoneNumber, textField.text!))
            
            switch response {
            case .success:
                print("data ok")
                phoneLine.lineColor = UIColor.green
                phoneLine.setNeedsDisplay()
            case .failure(_, let message):
                print(message.localized())
                phoneLine.lineColor = UIColor.red
                phoneLine.setNeedsDisplay()
            }
            
//            textField.text = format(phoneNumber: fullString)
//            print("textfield final: \(textField.text!)")

            
            
            return false
            
            
            
        }
        
        return true
    }
    
    
    // return false in cases where delegate detects invalid contents in the text field
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing")
        // editing name
        if (textField.tag == 1) {
            let response = Validation.shared.validate(values: (ValidationType.name, textField.text!))
            
            switch response {
            case .success:
                print("data ok")
                nameLine.lineColor = UIColor.green
                nameLine.setNeedsDisplay()
                
                break
            case .failure(_, let message):
                print(message.localized())
                nameLine.lineColor = UIColor.red
                nameLine.setNeedsDisplay()
                return false
            }
        }
            // editing mail
        else if (textField.tag == 2) {
            let response = Validation.shared.validate(values: (ValidationType.email, textField.text!))
            
            switch response {
            case .success:
                print("data ok")
                mailLine.lineColor = UIColor.green
                mailLine.setNeedsDisplay()
                break
            case .failure(_, let message):
                print(message.localized())
                mailLine.lineColor = UIColor.red
                mailLine.setNeedsDisplay()
                return false
            }
            
        }
            // editing phone
        else if (textField.tag == 3) {
            let response = Validation.shared.validate(values: (ValidationType.phoneNumber, textField.text!))
            
            switch response {
            case .success:
                print("data ok")
                phoneLine.lineColor = UIColor.green
                phoneLine.setNeedsDisplay()
                break
            case .failure(_, let message):
                print(message.localized())
                phoneLine.lineColor = UIColor.red
                phoneLine.setNeedsDisplay()
                return false
            }
        }
        
        return true
    }
    
    
    func validationOK(){
        
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear")
        
//        TODO: button
        
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.endEditing(true)
        
        return true
    }

    
    
    ///--------
    
    
    
    
    @objc func backgroundViewTapped() {
        print("backgroundViewTapped")
        nameTextField.endEditing(true)
        mailTextField.endEditing(true)
        phoneTextField.endEditing(true)
        
    }

    
    ///--------
    
    
    
    
    
    
    
    
    
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

