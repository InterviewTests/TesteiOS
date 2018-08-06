//
//  UITextFieldExtension.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

extension UITextField {
    func setBottomLine(width: CGFloat=1.0, color: UIColor=UIColor.lightGray) -> CALayer{
        let border = CALayer()
        
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0, y: frame.size.height - width, width: frame.size.width, height: frame.size.height)
        border.borderWidth = width
        
        layer.addSublayer(border)
        layer.masksToBounds = true
        
        return border
    }
}
