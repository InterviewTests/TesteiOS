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
        
        let convertedText = convertNumberToPhoneFormat(number: text)
        textField.text = convertedText
        delegate?.textDidChange(for: indexPath, text: convertedText, typeField: typeField)
    }
    
    private func convertNumberToPhoneFormat(number: String) -> String {
        
        var text = number.replacingOccurrences(of: "(", with: "")
        text = text.replacingOccurrences(of: ")", with: "")
        text = text.replacingOccurrences(of: "-", with: "")
        text = text.replacingOccurrences(of: " ", with: "")
        
        let textLenght = text.count
        
        if textLenght == 1 {
            return "(\(text)"
        } else if textLenght == 2 {
            return "(\(text)"
        } else if textLenght == 3 {
            return "(\(text.prefix(2))) \(text.suffix(1))"
        } else if textLenght == 4 {
            return "(\(text.prefix(2))) \(text.suffix(2))"
        } else if textLenght == 5 {
            return "(\(text.prefix(2))) \(text.suffix(3))"
        } else if textLenght == 6 {
            return "(\(text.prefix(2))) \(text.suffix(4))"
        } else if textLenght == 7 {
            return "(\(text.prefix(2))) \(text.suffix(5))"
        } else if textLenght == 8 {
            let start = text.index(text.startIndex, offsetBy: 2)
            let end = text.index(text.endIndex, offsetBy: -1)
            let range = start..<end
            return "(\(text.prefix(2))) \(text[range])-\(text.suffix(1))"
        } else if textLenght == 9 {
            let start = text.index(text.startIndex, offsetBy: 2)
            let end = text.index(text.endIndex, offsetBy: -2)
            let range = start..<end
            return "(\(text.prefix(2))) \(text[range])-\(text.suffix(2))"
        } else if textLenght == 10 {
            let start = text.index(text.startIndex, offsetBy: 2)
            let end = text.index(text.endIndex, offsetBy: -4)
            let range = start..<end
            return "(\(text.prefix(2))) \(text[range])-\(text.suffix(4))"
        } else if textLenght == 11 {
            let start = text.index(text.startIndex, offsetBy: 2)
            let end = text.index(text.endIndex, offsetBy: -4)
            let range = start..<end
            return "(\(text.prefix(2))) \(text[range])-\(text.suffix(4))"
        }
        return "\(number.prefix(15))"
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
