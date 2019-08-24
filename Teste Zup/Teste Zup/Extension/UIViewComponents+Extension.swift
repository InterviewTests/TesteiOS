//
//  UIViewComponents+Extension.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 24/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(textColor: UIColor, font: UIFont?) {
            self.init()
            self.translatesAutoresizingMaskIntoConstraints = false
            self.textColor = textColor
            self.font = font
    }
}

enum StyleView {
    case separatorStyle
}

extension UIView {
    convenience init(style: StyleView) {
        self.init()
        
        switch style {
        case .separatorStyle:
            self.backgroundColor = .black
            self.translatesAutoresizingMaskIntoConstraints = false
            self.alpha = 0.2
        }
    }
    
    
    convenience init(viewColor: UIColor) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 0
        self.backgroundColor = viewColor
    }
}
