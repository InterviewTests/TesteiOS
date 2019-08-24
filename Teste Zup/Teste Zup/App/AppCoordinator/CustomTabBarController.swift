//
//  CustomTabBarController.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 24/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

fileprivate protocol ConfigurableTabBar {
    func setupTabBar()
    func createNavigation(viewController: UIViewController, title: String) -> UINavigationController
}

class CustomTabBarController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
}

extension CustomTabBarController: ConfigurableTabBar {
    fileprivate func setupTabBar() {
        self.viewControllers = [createNavigation(viewController: FundController(), title: "Investimento"), createNavigation(viewController: FormController(), title: "Contato")]
        tabBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tabBar.barTintColor = #colorLiteral(red: 0.8549019608, green: 0.003921568627, blue: 0.003921568627, alpha: 1)
        }
    
    fileprivate func createNavigation(viewController: UIViewController, title: String) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor =  .white
        viewController.navigationController?.navigationBar.shadowImage = UIImage()
        navigation.navigationBar.barTintColor = .white
        viewController.navigationItem.title = title
       
        navigation.tabBarItem.title = title
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Arial", size: 20)!], for: .normal)
        return navigation
    }
}
