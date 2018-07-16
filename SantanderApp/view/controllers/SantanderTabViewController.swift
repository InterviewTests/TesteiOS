//
//  SantanderViewController.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 12/07/2018.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit

class SantanderTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = UIColor.white
        self.tabBar.backgroundImage = UIImage(named: "tab_item_invest")
        self.tabBar.itemPositioning = .fill

        debugPrint(R.font.dinProRegular.fontName)
        let attributes = [NSAttributedStringKey.font: UIFont(name: "DINPro", size: 18),
                          NSAttributedStringKey.foregroundColor: UIColor.white]
        let appearance = UITabBarItem.appearance()
        appearance.setTitleTextAttributes(attributes, for: .normal)
     
    }

  

}
