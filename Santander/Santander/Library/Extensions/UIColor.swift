//
//  UIColor.swift
//  Santander
//
//  Created by Orlando Amorim on 10/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import UIKit

extension UIColor {
    
    struct Santander {
        static let monza = UIColor(hexString: "#DA0101")
        static let guardsmanRed = UIColor(hexString: "#C80404")
        static let apricot = UIColor(hexString: "#EB7676")
    }
    
    convenience init(hexString: String, alpha: CGFloat? = 1.0) {
        var hexInt: UInt32 = 0
        let scanner = Scanner(string: hexString)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        scanner.scanHexInt32(&hexInt)
        
        let red = CGFloat((hexInt & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexInt & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexInt & 0xff) >> 0) / 255.0
        let alpha = alpha!
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
