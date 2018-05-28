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
    func layoutButton() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        if(self.isSelected) {
            self.layer.borderColor = UIColor.red.cgColor
            self.backgroundColor = .red
        } else {
            self.layer.borderColor = UIColor.red.cgColor
            self.backgroundColor = .red
        }
    }
    
}

extension UITextField {
    func layoutTextField() {
        
    }
}
