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
        static let silverChalice = UIColor(hexString: "#ACACAC")
        static let havelockBlue = UIColor(hexString: "#6DA1DF")
        static let gallery = UIColor(hexString: "#EFEEED")
        static let torchRed = UIColor(hexString: "#FF1F1F")
        static let sushi = UIColor(hexString: "#65BE30")
        static let gray = UIColor(hexString: "#7E7E7E")
        static let mineShaft = UIColor(hexString: "#333333")
        static let pastelGreen = UIColor(hexString: "#74DA61")
        static let emerald = UIColor(hexString: "#4AC16C")
        static let lightningYellow = UIColor(hexString: "#FFC011")
        static let burningOrange = UIColor(hexString: "#FF742C")
        static let redOrange = UIColor(hexString: "#FF3634")
        static let cloudy = UIColor(hexString: "#AFA9A3")
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
