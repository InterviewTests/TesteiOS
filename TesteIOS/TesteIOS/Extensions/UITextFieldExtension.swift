//
//  UITextFieldExtension.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

extension UITextField {
    func setBottomLine(color: UIColor=UIColor.lightGray, height: Double=1){
        layer.backgroundColor = UIColor.white.cgColor
        
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: height)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
    }
}
