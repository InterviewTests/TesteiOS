//
//  MainTabBar.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 16/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

class MainTabBar: UITabBarController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBar.barTintColor = UIColor.getColorDarkRed
        tabBar.items?.forEach({ (item) in
            item.setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: UIColor.white,
                 NSAttributedString.Key.font: UIFont(name: "DINPro-Medium", size: 19) as Any],
                for: .normal
            )
        })
        
        tabBar.items?.first?.title = "Investimento"
        tabBar.items?[1].title = "Contato"
    }
    
}

extension MainTabBar {
    enum BackgroundImageName: String {
        case form = "tab_bar_contato"
        case fundDetails = "tab_bar_investimento"
    }
}
