//
//  Extensions.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 28/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation
import UIKit



extension UIButton {
    func layoutRedButton() {
        self.backgroundColor = .red
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.red.cgColor
    }
    
    func layoutButtonText() {
        self.titleLabel?.minimumScaleFactor = 0.5
        self.titleLabel?.numberOfLines = 1
        self.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    func setSelected() {
        self.isSelected = !self.isSelected
    }
    
}






