//
//  UIFont.swift
//  Santander
//
//  Created by Orlando Amorim on 11/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import UIKit.UIFont

extension UIFont {
    
    enum SantanderFontType {
        case medium
        case regular
        case light
    }
    
    static func santander(type: SantanderFontType = .regular, with size: CGFloat) -> UIFont {
        switch type {
        case .medium: return UIFont(name: "DINPro-Medium", size: size)!
        case .regular: return UIFont(name: "DINPro-Regular", size: size)!
        case .light: return UIFont(name: "DINPro-Light", size: size)!
        }
    }
}
