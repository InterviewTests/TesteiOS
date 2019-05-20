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
        viewControllers = homeCoordinator?.viewControllers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        // TODO: Change red color to custom red color
        tabBar.tintColor = .white
        tabBar.barTintColor = .red
    }

}
