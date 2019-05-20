//
//  HomeCoordinator.swift
//  santander
//
//  Created by Jonatha Lima on 18/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit
import SafariServices

public protocol Funding: AnyObject {
    func invest()
}

public protocol Contacting: AnyObject {
    func contact()
}

public protocol Browsing {
    func navigate(to url: String)
}

public class HomeCoordinator: Coordinator {
    
    public var viewControllers: [UIViewController]
    
    private var homeController: HomeTabViewController
    
    init(homeController: HomeTabViewController) {
        self.homeController = homeController
        
        let fundsController = FundsViewController()
        
        let fundsNavigationController =
            SANavigationViewController(rootViewController: fundsController)
        
        let contactController = ContactViewController()
        
        let contactNavigationController =
            SANavigationViewController(rootViewController: contactController)
        
        self.viewControllers = [fundsNavigationController,
                                contactNavigationController]
        
        fundsController.delegate = self
        
    }
    
    public func start() {}
    
}

extension HomeCoordinator: Funding {
    
    public func invest() {
        // TODO: Start funds coordinator
    }
    
}

extension HomeCoordinator: Contacting {
    public func contact() {
        // TODO: Start contact coordinator
    }
    
}

extension HomeCoordinator: Browsing {
    
    public func navigate(to url: String) {
        
        guard let url = URL(string: url) else {
            return
        }
        
        let safariController = SFSafariViewController(url: url)
        
        homeController.present(safariController,
                               animated: true,
                               completion: nil)
    }
    
}
