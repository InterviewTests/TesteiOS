//
//  FieldCell.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 14/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

protocol FieldCellDelegate: class {
    func textDidChange(for indexPath: IndexPath, text: String, typeField: TypeField)
}

class FieldCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var lineView: UIView!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    static let reuseIdentifier = "FieldCell"
    
    weak var delegate: FieldCellDelegate?
    
    var viewModel: FieldCell.ViewModel? {
        didSet {
            didSetViewModel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    private func configureLayout() {
        label.textColor = UIColor.getColorDarkGray
        lineView.backgroundColor = UIColor.getColorLightGray
    }
    
    private func didSetViewModel() {
        guard let viewModel = viewModel else { return }
        label.text = viewModel.message ?? "-"
        topConstraint.constant = CGFloat(viewModel.topSpace ?? 8)
        if viewModel.typeField == .telNumber {
            textField.keyboardType = .decimalPad
        }
    }
    
    @IBAction func textFieldDidChange(_ sender: Any) {
        guard
            let indexPath = viewModel?.indexPath,
            let text = textField.text,
            let typeField = viewModel?.typeField
        else { return }
        
        if typeField == .telNumber {
            let convertedText = convertNumberToPhoneFormat(number: text)
            textField.text = convertedText
            delegate?.textDidChange(for: indexPath, text: convertedText, typeField: typeField)
        } else {
            delegate?.textDidChange(for: indexPath, text: text, typeField: typeField)
        }
    }
    
    private func convertNumberToPhoneFormat(number: String) -> String {
        var text = number.replacingOccurrences(of: "(", with: "")
        text = text.replacingOccurrences(of: ")", with: "")
        text = text.replacingOccurrences(of: "-", with: "")
        text = text.replacingOccurrences(of: " ", with: "")
        
        let textLenght = text.count
        
        switch textLenght {
        case 1, 2:
            return "(\(text)"
        case 3, 4, 5, 6, 7:
            return "(\(text.prefix(2))) \(text.suffix(textLenght - 2))"
        case 8, 9:
            let start = text.index(text.startIndex, offsetBy: 2)
            let end = text.index(text.endIndex, offsetBy: 7 - textLenght)
            let range = start..<end
            return "(\(text.prefix(2))) \(text[range])-\(text.suffix(textLenght - 7))"
        case 10, 11:
            let start = text.index(text.startIndex, offsetBy: 2)
            let end = text.index(text.endIndex, offsetBy: -4)
            let range = start..<end
            return "(\(text.prefix(2))) \(text[range])-\(text.suffix(4))"
        default:
            return "\(number.prefix(15))"
        }
    }
    
}

extension FieldCell {
    struct ViewModel {
        let message: String?
        let topSpace: Int?
        let typeField: TypeField?
        let indexPath: IndexPath
    }
}
