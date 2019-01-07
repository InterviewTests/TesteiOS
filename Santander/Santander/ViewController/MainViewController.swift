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
//        self.tabBar.tintColor       = .appColor
        self.tabBar.backgroundColor = .white
        self.hidesBottomBarWhenPushed = true
        
        /// Creates instances of the View Controllers
        let contactController = ContactViewController()
        let productController = ProductViewController()
        
        /// Sets the names for the tabs, the images and their index
        contactController.tabBarItem = UITabBarItem(title: "Contato"       , image: nil, tag: 0)
        productController.tabBarItem = UITabBarItem(title: "Investimento" , image: nil, tag: 1)
        
        /// Adds the ViewControllers to the TabBarController
        self.viewControllers = [contactController, productController].map {
            UINavigationController(rootViewController: $0)
        }
    }
}

