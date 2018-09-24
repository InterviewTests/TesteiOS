//
//  AddContactCellView.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 23/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

class AddContactFieldView: UIView {
    @IBOutlet private weak var placeholderLabel : UILabel!
    @IBOutlet private weak var textField : UITextField!
    
    private var viewModel : CellViewModel!
    
    
    init(viewModel : CellViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.xib()
        self.prepareLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.xib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.prepareLayout()
    }
    
    func set(viewModel : CellViewModel) {
        self.viewModel = viewModel
        self.prepareLayout()
    }

    private func prepareLayout() {
        self.placeholderLabel.text  = viewModel.message
        self.textField.delegate     = self
        self.textField.setLine()
        
        switch viewModel.typeField {
        case .email:
            self.textField.keyboardType = .emailAddress
        case .telNumber:
            self.textField.keyboardType = .numberPad
        default:
            self.textField.keyboardType = .default
        }
    }
}

extension AddContactFieldView : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
