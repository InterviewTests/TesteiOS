//
//  Checkbox.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 21/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

class CheckBox: UIButton {
    var selectedColor = UIColor.selectedCheckbox
    var unselectedColor = UIColor.white
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked {
                self.backgroundColor = selectedColor
            } else {
                self.backgroundColor = unselectedColor
            }
        }
    }
    
    init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.borderCheckbox.cgColor
        self.addTarget(self, action: #selector(buttonClicked), for: UIControlEvents.touchUpInside)
        self.isChecked = false
    }
}

extension CheckBox {
    @objc
    func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
