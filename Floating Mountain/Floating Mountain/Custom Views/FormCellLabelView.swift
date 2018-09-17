//
//  FormCellLabelView.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 9/16/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

import UIKit

class FormCellLabelView: FormCellView {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = regularFont
        label.textColor = #colorLiteral(red: 0.6745098039, green: 0.6745098039, blue: 0.6745098039, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        setupConstraints(for: label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubview(label)
        setupConstraints(for: label)
    }
    
    override func setup(for formCell: Contact.FetchForm.ViewModel.CellViewModel) {
        super.setup(for: formCell)
        label.text = formCell.message
    }
    
}
