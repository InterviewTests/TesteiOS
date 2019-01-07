//
//  MainViewController.swift
//  Santander
//
//  Created by Jonathan Martins on 04/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
    }
    
    /// Creates the main view of the app with it`s respective tabs
    private func setupTabBarController(){
        
        /// Sets the selected colour for the icons and the
        self.tabBar.barTintColor      = .red
        self.hidesBottomBarWhenPushed = true
        
        UITabBarItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont(name: "Avenir-Black", size:12)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ], for: .normal)
        
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -14)


        
        /// Creates instances of the View Controllers
        let contactController = ContactViewController()
        let productController = ProductViewController()
        
        /// Sets the names for the tabs, the images and their index
        productController.tabBarItem = UITabBarItem(title: "Investimento" , image: UIImage(), tag: 0)
        contactController.tabBarItem = UITabBarItem(title: "Contato"      , image: UIImage(), tag: 1)
        
        /// Adds the ViewControllers to the TabBarController
        self.viewControllers = [productController, contactController].map {
            UINavigationController(rootViewController: $0)
        }
    }
}

