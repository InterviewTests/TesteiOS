//
//  UILabel+Extensions.swift
//  FinForm
//
//  Created by Gustavo Luís Soré on 22/07/2018.
//  Copyright © 2018 Sore. All rights reserved.
//

import UIKit

extension UILabel{
    
    func copyLabel() -> UILabel{
        let label = UILabel.init(frame: self.frame)
        label.font = self.font
        label.backgroundColor = UIColor.clear
        label.textColor = self.textColor
        label.text = self.text
        return label
    }
    
}
