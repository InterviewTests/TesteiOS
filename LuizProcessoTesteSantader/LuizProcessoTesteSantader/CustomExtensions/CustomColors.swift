//
//  CustomColors.swift
//  LuizProcessoTesteSantader
//
//  Created by Luiz Otavio Processo on 27/09/19.
//  Copyright © 2019 Luiz Otavio Processo. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    
    static var appRed: UIColor { return UIColor.fromIntRGB(red: 218.0, green: 1.0, blue: 1.0) }
    static var appDarkRed: UIColor { return UIColor.fromIntRGB(red: 150.0, green: 1.0, blue: 1.0) }
    
    static var appLightGreen: UIColor { return UIColor.fromIntRGB(red: 116.0, green: 218.0, blue: 97.0) }
    static var appGreen: UIColor { return UIColor.fromIntRGB(red: 74.0, green: 193.0, blue: 108.0) }
    static var appYellow: UIColor { return UIColor.fromIntRGB(red: 255.0 , green: 192.0, blue: 17.0) }
    static var appOrange: UIColor { return UIColor.fromIntRGB(red: 255.0, green: 116.0, blue: 44.0) }
    static var appRiskRed: UIColor { return UIColor.fromIntRGB(red: 255.0, green: 54.0, blue: 52.0) }

    static func fromIntRGB(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        
        let r =  (red * 1) / 255.0
        let g = (green * 1) / 255.0
        let b = (blue * 1) / 255.0
        let a = CGFloat(1.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
        
    }
}
