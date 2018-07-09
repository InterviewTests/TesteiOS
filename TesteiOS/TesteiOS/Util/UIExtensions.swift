//
//  UIExtensions.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/8/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import UIKit

extension UIColor {
    open class var selectedRed: UIColor { return UIColor(red: 207, green: 0, blue: 0, alpha: 1) }
    open class var unselectedRed: UIColor { return UIColor(red: 225, green: 0, blue: 0, alpha: 1) }
    open class var highlightedRed: UIColor { return UIColor(red: 241, green: 116, blue: 118, alpha: 1) }
}

extension UIImage {
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

extension UITabBarController {
    func setSelectionIndicatorColor (color: UIColor) {
        let tabBarItemSize = CGSize(width: self.tabBar.frame.width / 2, height: self.tabBar.frame.height)
        self.tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: color, size: tabBarItemSize).resizableImage(withCapInsets: .zero)
        self.tabBar.frame.size.width = self.view.frame.width + 4
        self.tabBar.frame.origin.x = -2
    }
}

extension UITextField {
    func setBottomBorder(withColor color: UIColor, width: CGFloat = CGFloat(1.0)) {
        let borderLayer = CALayer()
        borderLayer.frame = CGRect(x: 0, y: bounds.size.height - width, width: bounds.size.width, height: bounds.size.height)
        borderLayer.borderColor = color.cgColor
        borderLayer.borderWidth = width
        
        self.layer.addSublayer(borderLayer)
        self.layer.masksToBounds = true
    }
}
