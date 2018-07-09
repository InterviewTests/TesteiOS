//
//  FormTableViewCell.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/8/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import UIKit

protocol FormTableViewCellDelegate {
    func buttonClicked()
}

class FormTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var checkInfo: UILabel!
    @IBOutlet weak var checkBox: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    var cell: Cell? = nil
    var delegate: FormTableViewCellDelegate? = nil
    var checked: Bool = false
    var auxString: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(_ delegate: FormTableViewCellDelegate, cell: Cell) {
        self.delegate = delegate
        self.cell = cell
        
        switch cell.type {
        case Cell.CellType.field.rawValue:
            self.updateFieldCell(cell: cell)
        case Cell.CellType.text.rawValue:
            self.updateTextCell(cell: cell)
        case Cell.CellType.checkbox.rawValue:
            self.updateCheckboxCell(cell: cell)
        case Cell.CellType.button.rawValue:
        self.updateButtonCell(cell: cell)
        default:
            ()
        }
    }
    
    func updateFieldCell(cell: Cell) {
//        self.textField.frame = CGRect(x: self.textField.frame.minX, y: self.textField.frame.minY, width: self.textField.frame.width, height: 50)
        self.textField.placeholder = cell.message
        self.textField.setBottomBorder(withColor: UIColor.lightGray)
        self.textField.delegate = self
    }
    
    func updateTextCell(cell: Cell) {
        self.label.text = cell.message
    }
    
    func updateCheckboxCell(cell: Cell) {
        self.checkInfo.text = cell.message
        self.checkBox.image = UIImage(named: "\(self.checked ? "" : "un")checked")
    }
    
    func toggleCheck() {
        self.checked = !self.checked
    }
    
    
    func updateButtonCell(cell: Cell) {
        self.button.setTitle(cell.message, for: .normal)
    }
    
    // MARK: Validation
    
    func validateInput () -> Bool {
        var result = true
        
        guard self.cell != nil && self.cell!.type == Cell.CellType.field.rawValue && !self.cell!.hidden else {
            return result
        }
        
        if let fieldType: Int = self.cell!.typefield {
            switch fieldType {
            case Cell.FieldType.text.rawValue:
                result = !self.textField.text!.isEmpty
            case Cell.FieldType.email.rawValue:
                result = self.isValidRegEx(self.textField.text!, RegEx.email)
            case Cell.FieldType.phoneNumber.rawValue:
                result = self.isValidRegEx(self.textField.text!, RegEx.phoneNumber)
            default:()
            }
        } else {
            result = self.isValidRegEx(self.textField.text!, RegEx.phoneNumber)
        }
        
        self.textField.setBottomBorder(withColor: result ? UIColor.green : UIColor.red)
        self.textField.resignFirstResponder()
        
        return result
    }
    
    // MARK: - UIButton
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        self.delegate?.buttonClicked()
    }
    
    // MARK: - UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard self.cell != nil && self.cell!.type == Cell.CellType.field.rawValue && self.cell!.typefield == Cell.FieldType.phoneNumber.rawValue else {
            return true
        }
        
        var auxString = textField.text!
        
        switch string {
        case "":
            auxString = String(auxString.characters.dropLast())
        case "0","1","2","3","4","5","6","7","8","9":
            auxString += string
        default:()
        }
        
        auxString = self.formatAsPhoneNumber(auxString)
        textField.text = auxString
        
        return false
    }
    
    func formatAsPhoneNumber(_ phoneString: String) -> String {
        var formattedString = ""
        let unformattedString = phoneString.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var phoneMask = unformattedString.count > 10 ? "(##) #####-####" : "(##) ####-####"
        
        var index = unformattedString.startIndex
        for ch in phoneMask.characters {
            if index == unformattedString.endIndex {
                break
            }
            if ch == "#" {
                formattedString.append(unformattedString[index])
                index = unformattedString.index(after: index)
            } else {
                formattedString.append(ch)
            }
        }
        return formattedString
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.validateInput()
    }
    
    func isValidRegEx(_ testStr: String, _ regex: RegEx) -> Bool {
        let stringTest = NSPredicate(format:"SELF MATCHES %@", regex.rawValue)
        let result = stringTest.evaluate(with: testStr)
        return result
    }
}

extension CGRect {
    func decreaseRect(byPercentage percentage: CGFloat) -> CGRect {
        let startWidth = self.width
        let startHeight = self.height
        let adjustmentWidth = (startWidth * percentage) / 2.0
        let adjustmentHeight = (startHeight * percentage) / 2.0
        return self.insetBy(dx: adjustmentWidth, dy: adjustmentHeight)
    }
}

enum RegEx: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" // "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]+"
    case phoneNumber = "\\([0-9]{2}\\)\\s[0-9]{4,5}-[0-9]{4}" // Phone Number formatted
}
