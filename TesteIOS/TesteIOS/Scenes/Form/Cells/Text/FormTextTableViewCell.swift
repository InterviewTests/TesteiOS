//
//  FormTextTableViewCell.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit
import JMMaskTextField_Swift

class FormTextTableViewCell: UITableViewCell, FormDefaultCellProtocol {
    
    @IBOutlet weak var fieldNameDistanceToTop: NSLayoutConstraint!
    @IBOutlet weak var fieldNameLabel: UILabel!
    @IBOutlet weak var textField: JMMaskTextField!
    
    private var validator: StringValidator?
    var delegate: FormDefaultCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //    MARK: - Set
    func setCell(cell: Form.FetchCells.ViewModel.DisplayedCell) {
        fieldNameDistanceToTop.constant = CGFloat(cell.topSpacing)
        fieldNameLabel.text = cell.message
        
        textField.setBottomLine()
        setTextFieldValidator(type: cell.typeField)
    }
    
    func setTextFieldValidator(type: CellTypeField?){
        guard let type = type else {
            return
        }
        
        switch type {
        case .Email:
            textField.delegate = self
            validator = StringEmailValidator()
            textField.keyboardType = .emailAddress
            break
            
        case .TelNumber:
            textField.maskString = "(00) 0000-00000"
            validator = StringTelValidator()
            textField.keyboardType = .phonePad
            textField.delegate = self
            break
            
        default:
            break
        }
    }
}

extension FormTextTableViewCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let validator = validator else {
            return true
        }
        
        let nsText = NSString(string: textField.text ?? "")
        let newText = nsText.replacingCharacters(in: range, with: string)
        
        textField.layer.shadowColor = validator.validate(text: newText) ? UIColor.green.cgColor : UIColor.red.cgColor
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
