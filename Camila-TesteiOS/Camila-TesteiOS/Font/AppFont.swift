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
            return loadFont(withName: available.DINNeuzeitGrotesk.Light, size: 15)
        }
        static var textBig: UIFont{
            return loadFont(withName: available.DINNeuzeitGrotesk.Light, size: 16)
        }
        static var titleRegular: UIFont{
            return loadFont(withName: available.DINPro.Black, size: 16)
        }
        static var titleSmall: UIFont{
            return loadFont(withName: available.DINPro.Black, size: 16)
        }
        static var titleBig: UIFont{
            return loadFont(withName: available.DINPro.Black, size: 30)
        }
    }
    
    static func loadFont (withName name: String, size : CGFloat) -> UIFont{
        guard let font = UIFont(name: name, size: size) else{
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
    
    
    
}
