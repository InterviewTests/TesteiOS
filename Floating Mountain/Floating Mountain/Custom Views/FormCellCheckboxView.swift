//
//  FormCellCheckboxView.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 9/16/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

import UIKit

protocol FormCellCheckboxViewDelegate: class {
    func formCellCheckbox(_ formCellCheckbox: FormCellCheckboxView, didChangeSelection selected: Bool)
}

class FormCellCheckboxView: FormCellView {

    lazy var checkboxButton: CheckboxButton = {
        let button = CheckboxButton()
        button.titleEdgeInsets.left = 8
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.font = regularFont
        button.setTitleColor(#colorLiteral(red: 0.6745098039, green: 0.6745098039, blue: 0.6745098039, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(selectionChange(_:)), for: .valueChanged)
        button.sizeToFit()
        return button
    }()
    
    weak var delegate: FormCellCheckboxViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(checkboxButton)
        setupConstraints(for: checkboxButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubview(checkboxButton)
        setupConstraints(for: checkboxButton)
    }

    override func setup(for formCell: Contact.FetchForm.ViewModel.CellViewModel) {
        super.setup(for: formCell)
        checkboxButton.setTitle(formCell.message, for: .normal)
    }
    
    @objc func selectionChange(_ checkboxButton: CheckboxButton) {
        delegate?.formCellCheckbox(self, didChangeSelection: checkboxButton.isSelected)
    }
    
}
