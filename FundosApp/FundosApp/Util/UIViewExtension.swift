//
//  UIViewExtension.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 09/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import UIKit
extension UIView {
    
    
    
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.black.cgColor)
        }
        set{
            layer.borderColor = newValue?.cgColor ?? UIColor.black.cgColor
        }
    }
    
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            
        }
    }
    
}
