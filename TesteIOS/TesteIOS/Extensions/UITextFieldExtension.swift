//
//  UITextFieldExtension.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

extension UITextField {
    func setBottomLine(){
        layer.backgroundColor = UIColor.white.cgColor
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
    }
}
