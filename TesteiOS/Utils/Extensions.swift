//
//  Extensions.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 28/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField
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

extension SkyFloatingLabelTextField {
    
    func layoutTextField(configText:String) {
        let lightGreyColor = UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1.0)
        self.selectedTitleColor = lightGreyColor
        self.placeholder = configText
        self.title = self.placeholder
    }
}
