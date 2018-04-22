//
//  Font.swift
//  Santander
//
//  Created by Gabriel vieira on 4/22/18.
//  Copyright © 2018 Gabriel vieira. All rights reserved.
//

import UIKit

extension UIFont {
    
    func DINEngschriftStd(ofSize fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "DINEngschriftStd", size: fontSize) else {
            return UIFont.systemFont(ofSize: fontSize)
        }
        return font
    }
    
    func DINMittelschriftStd(ofSize fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "DINMittelschriftStd", size: fontSize) else {
            return UIFont.systemFont(ofSize: fontSize)
        }
        return font
    }
    
    func DINNeuzeitGroteskStd_BdCond(ofSize fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "DINNeuzeitGroteskStd-BdCond", size: fontSize) else {
            return UIFont.systemFont(ofSize: fontSize)
        }
        return font
    }
    
    func DINNeuzeitGroteskStd_Light(ofSize fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "DINNeuzeitGroteskStd-Light", size: fontSize) else {
            return UIFont.systemFont(ofSize: fontSize)
        }
        return font
    }
    
    func DINPro_Black(ofSize fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "DINPro-Black", size: fontSize) else {
            return UIFont.systemFont(ofSize: fontSize)
        }
        return font
    }
    
    func DINPro_Bold(ofSize fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "DINPro-Bold", size: fontSize) else {
            return UIFont.systemFont(ofSize: fontSize)
        }
        return font
    }
    
    func DINPro_Light(ofSize fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "DINPro-Light", size: fontSize) else {
            return UIFont.systemFont(ofSize: fontSize)
        }
        return font
    }
    
    func DINPro_Medium(ofSize fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "DINPro-Medium", size: fontSize) else {
            return UIFont.systemFont(ofSize: fontSize)
        }
        return font
    }
    
    func DINPro_Regular(ofSize fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "DINPro-Regular", size: fontSize) else {
            return UIFont.systemFont(ofSize: fontSize)
        }
        return font
    }
    
}
