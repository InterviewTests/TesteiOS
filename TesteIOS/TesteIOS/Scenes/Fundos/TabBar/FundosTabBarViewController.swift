//
//  FundosTabBarViewController.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 06/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class FundosTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configTabBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configTabBarSelectionIndicator()
    }
    
    //    MARK: - Config
    func configTabBar(){
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor.white
        tabBar.barTintColor = UIColor.Default.red
        tabBar.unselectedItemTintColor = UIColor.white
    }
    
    func configTabBarSelectionIndicator(){
        let numberOfItems = CGFloat(tabBar.items!.count)
        let itemWidth = tabBar.frame.width/numberOfItems
        let itemHeight = tabBar.frame.height+5
        
        let size = CGSize(width: itemWidth, height: itemHeight)
        tabBar.selectionIndicatorImage = UIImage(color: UIColor.Default.darkRed, size: size)?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
}
