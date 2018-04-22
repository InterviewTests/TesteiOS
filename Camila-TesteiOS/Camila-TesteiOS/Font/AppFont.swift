//
//  AppFont.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 22/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit

enum AppFont {
    enum available{
        static let DINEngschriftStd = "DINEngschriftStd"
        static let DINMittelschriftStd = "DINMittelschriftStd"
        enum DINNeuzeitGrotesk {
            static let BdCond = "DINNeuzeitGroteskStd-BdCond"
            static let Light = "DINNeuzeitGroteskStd-Light"
        }
        enum DINPro {
            static let Black = "DINPro-Black"
            static let Bold = "DINPro-Bold"
            static let Light = "DINPro-Light"
            static let Medium = "DINPro-Medium"
            static let Regular = "DINPro-Regular"
        }
        
    }
    
    struct defaultFonts {
        static var text: UIFont{
            return loadFont(withName: available.DINPro.Light, size: 15)
        }
        static var textBig: UIFont{
            return loadFont(withName: available.DINMittelschriftStd, size: 17)
        }
        static var titleRegular: UIFont{
            return loadFont(withName: available.DINPro.Black, size: 16)
        }
        static var titleSmall: UIFont{
            return loadFont(withName: available.DINPro.Black, size: 16)
        }
        static var titleBig: UIFont{
            return loadFont(withName: available.DINPro.Bold, size: 30)
        }
    }
    
    static func loadFont (withName fontName: String, size : CGFloat) -> UIFont{
        return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    
    
}
