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
