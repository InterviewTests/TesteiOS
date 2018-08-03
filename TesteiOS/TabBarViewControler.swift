//
//  TabBarViewControler.swift
//  TesteiOS
//
//  Created by Dafle Cardoso on 02/08/2018.
//  Copyright © 2018 Dafle Cardoso. All rights reserved.
//

import UIKit

class TabBarViewControler: UITabBarController {

    let color = UIColor(red: 234.0/255.0, green: 120.0/255.0, blue: 115.0/255.0, alpha: 1.0)
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 10.0, *) {
            tabBar.unselectedItemTintColor = .white
        }
        
        tabBar.tintColor = .white
        tabBar.clipsToBounds = true
        
        guard let font = UIFont(name: "DINPro-Regular", size: 18.0) else {
            print("Font not found")
            return
        }
        
        UITabBarItem.appearance().setTitleTextAttributes([.font: font], for: .normal)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.invalidateIntrinsicContentSize()
        
        var vertical:CGFloat = 0
        
        if UIDevice.current.orientation.isPortrait {
            
            vertical = -12
        }
        
        tabBar.items?.forEach({ (tabbaritem) in
            
            tabbaritem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: vertical)
        })
        
        let image = UIImage.from(color: color, width: Double(tabBar.bounds.size.width / 2.0),height: Double(tabBar.bounds.size.height))
        UITabBar.appearance().selectionIndicatorImage = image
        tabBar.selectionIndicatorImage = image
        
        print("Olha o tamanhoo", tabBar.bounds.size.width)
    }
}

extension UIImage {
    static func from(color: UIColor, width:Double, height:Double) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
