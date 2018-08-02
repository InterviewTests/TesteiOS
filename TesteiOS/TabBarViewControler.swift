//
//  TabBarViewControler.swift
//  TesteiOS
//
//  Created by Dafle Cardoso on 02/08/2018.
//  Copyright © 2018 Dafle Cardoso. All rights reserved.
//

import UIKit

class TabBarViewControler: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .white
        
        tabBar.selectionIndicatorImage = UIImage.from(
            color: UIColor(red: 234.0/255.0,
                           green: 120.0/255.0,
                           blue: 115.0/255.0,
                           alpha: 1.0),
            width: Double(view.frame.width) / 2.0,
            height: Double(tabBar.frame.size.height + 2)
        )
     
        guard let font = UIFont(name: "DINPro-Regular", size: 15.0) else {
            print("Font not found")
            return
        }
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: font ], for: .normal)
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
