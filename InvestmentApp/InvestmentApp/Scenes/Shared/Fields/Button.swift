//
//  Checkbox.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 21/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

class Button: UIButton {
    init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor.buttonBackgroundRed
        self.setTitleColor(UIColor.white, for: .normal)
    }
}
