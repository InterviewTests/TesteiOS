//
//  UIView+Utils.swift
//  Santander
//
//  Created by Jonathan Martins on 07/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//
import UIKit

extension UIView {
    
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius  = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    var borderWidth: CGFloat{
        get {
            return layer.borderWidth
        }
        set{
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    var borderColor: UIColor?{
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set{
            layer.borderColor = newValue?.cgColor
        }
    }
}
