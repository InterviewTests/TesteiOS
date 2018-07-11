//
//  TextFieldTableViewCell.swift
//  TesteiOS
//
//  Created by lucas.eiji.saito on 06/07/18.
//  Copyright © 2018 Accenture. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTextField: UILabel!
    @IBOutlet weak var textFieldInput: UITextField!
    @IBOutlet weak var viewBottomLine: UIView!
    @IBOutlet weak var buttonClear: UIButton!
    @IBAction func buttonClearTouchUpInside(_ sender: UIButton) {
        textFieldInput.text = ""
    }
    @IBAction func textFieldDidBegin(_ sender: UITextField) {
        if ((sender.text ?? "").count == 0) {
            viewBottomLine.backgroundColor = UIColor.lightGray
        }
    }
    @IBAction func textFieldDidEnd(_ sender: UITextField) {
        if ((sender.text ?? "").count == 0) {
            viewBottomLine.backgroundColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1.0)
        }
    }
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        let colorValid = UIColor(red: 155.0/255.0, green: 206.0/255.0, blue: 111.0/255.0, alpha: 1.0)
        let colorInvalid = UIColor(red: 239.0/255.0, green: 103.0/255.0, blue: 96.0/255.0, alpha: 1.0)
        if (viewModel.type == .field) {
            if (viewModel.typeField! == .text) {
                if ((sender.text ?? "").count > 0) {
                    viewBottomLine.backgroundColor = colorValid
                    viewModel.isValid = true
                } else {
                    viewBottomLine.backgroundColor = colorInvalid
                    viewModel.isValid = false
                }
            }
            if (viewModel.typeField! == .email) {
                if (isValidEmail(testStr: sender.text ?? "")) {
                    viewBottomLine.backgroundColor = colorValid
                    viewModel.isValid = true
                } else {
                    viewBottomLine.backgroundColor = colorInvalid
                    viewModel.isValid = false
                }
            }
            if (viewModel.typeField! == .telNumber) {
                if (isValidTelNumber(testStr: sender.text ?? "")) {
                    viewBottomLine.backgroundColor = colorValid
                    viewModel.isValid = true
                } else {
                    viewBottomLine.backgroundColor = colorInvalid
                    viewModel.isValid = false
                }
            }
        }
    }
    
    var viewModel: Form.FormCell.ViewModel = Form.FormCell.ViewModel() {
        didSet {
            didSetViewModel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func didSetViewModel() {
        configCell()
    }
    
    func configCell() {
        for constraint in self.contentView.constraints {
            if constraint.identifier == "constraintLabelTop" {
                constraint.constant = CGFloat(viewModel.topSpacing)
            }
        }
        self.contentView.layoutIfNeeded()
        
        labelTextField.text = viewModel.message
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func isValidTelNumber(testStr:String) -> Bool {
        let telNumberRegEx = "^\\([1-9]{2}\\) [2-9][0-9]{3,4}\\-[0-9]{4}$"
        
        let telNumberTest = NSPredicate(format:"SELF MATCHES %@", telNumberRegEx)
        return telNumberTest.evaluate(with: testStr)
    }
}
