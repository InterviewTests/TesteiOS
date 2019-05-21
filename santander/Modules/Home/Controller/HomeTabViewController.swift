//
//  HomeTabViewController.swift
//  santander
//
//  Created by Jonatha Lima on 18/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

class HomeTabViewController: UITabBarController {
    
    private var homeCoordinator: HomeCoordinator?
    
    override func loadView() {
        super.loadView()
        homeCoordinator = HomeCoordinator(homeController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = homeCoordinator?.viewControllers
        setup()
    }
    
    private func setup() {
        // TODO: Change red color to custom red color
        tabBar.tintColor = .white
        tabBar.barTintColor = .red
        
        UITabBarItem.appearance()
            .setTitleTextAttributes([NSAttributedString.Key
                .font : Resource.Font.medium.of(size: 16)],
                                    for: .normal)
        
        if #available(iOS 10.0, *) {
            tabBar.unselectedItemTintColor =
                UIColor(white: 1, alpha: 0.5)
        }
        
        guard let items = tabBar.items else {
            return
        }
        
        for item in items {
            item.titlePositionAdjustment =
                UIOffset(horizontal: 0, vertical: -13)
        }
        
    }
    
}
