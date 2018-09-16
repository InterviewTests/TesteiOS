//
//  FormCellSendButtonView.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 9/16/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

import UIKit

class FormCellSendButtonView: FormCellView {

    lazy var button: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = mediumFont
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "button-background-normal"), for: .normal)
        button.sizeToFit()
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(button)
        setupConstraints(for: button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubview(button)
        setupConstraints(for: button)
    }
    
    override func setup(for formCell: Contact.FetchForm.ViewModel.CellViewModel) {
        super.setup(for: formCell)
        button.setTitle(formCell.message, for: .normal)
    }

}
