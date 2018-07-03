//
//  MainTabBarController.swift
//  TesteiOS
//
//  Created by Carolina Bonturi on 6/21/18.
//  Copyright © 2018 Carolina Bonturi. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    let deselectItemColorBackground = UIColor.hexStringToUIColor(hex: "#D80A16")
    let selectedItemColorBackground = UIColor.hexStringToUIColor(hex: "#D13235")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUIInTabBar()

    }

    
    func configureUIInTabBar() {
        
        let titlePosition = UIOffset(horizontal: 0, vertical: -(tabBar.frame.height/2.0))
        let numberOfItems = CGFloat(tabBar.items!.count)
        
        // set general characteristics
        if let firstItem = tabBar.items!.first {
            firstItem.title = "Investimento"
            firstItem.titlePositionAdjustment = titlePosition
        }
        
        if let secondItem = tabBar.items!.last {
            secondItem.title = "Contato"
            secondItem.titlePositionAdjustment = titlePosition
        }
        
        tabBar.tintColor = UIColor.white
        tabBar.barTintColor = deselectItemColorBackground
        
        
        // set item characteristics when selected
        let selectedTabBarItemHeight = CGSize(width: tabBar.frame.width / numberOfItems, height: tabBar.frame.height + 3)
        
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: selectedItemColorBackground, size: selectedTabBarItemHeight)
        tabBar.unselectedItemTintColor = UIColor.white
    }
    
}



extension UIImage {
    
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
}


extension UIColor {

    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}

