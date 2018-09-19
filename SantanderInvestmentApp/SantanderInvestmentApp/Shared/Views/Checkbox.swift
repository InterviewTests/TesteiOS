//
//  Checkbox.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 18/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation
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
