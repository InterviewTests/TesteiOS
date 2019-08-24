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
    case shareButton
}

extension UIView {
    convenience init(style: StyleView) {
        self.init()
        
        switch style {
        case .separatorStyle:
            self.translatesAutoresizingMaskIntoConstraints = false
            let image = UIImageView(image: UIImage(named: "separator_inline"))
            self.addSubview(image)
            image.fillSuperview()
            image.contentMode = .scaleAspectFill
        default:
            print("")
        }
    }
    
    
    convenience init(viewColor: UIColor) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 0
        self.backgroundColor = viewColor
    }
}


extension UIBarButtonItem {
    convenience init(styleGuide: StyleView) {
        self.init()
        switch styleGuide {
        case .shareButton:
            self.image = UIImage(named: "share")
            self.tintColor = .red
        default:
            print("")
        }
        
    }
}
