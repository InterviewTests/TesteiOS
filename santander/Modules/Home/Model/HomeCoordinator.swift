//
//  HomeCoordinator.swift
//  santander
//
//  Created by Jonatha Lima on 18/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public protocol Funding: AnyObject {
    func invest()
}

public protocol Contacting: AnyObject {
    func contact()
}

public class HomeCoordinator: Coordinator {
    
    public var viewControllers: [UIViewController]
    
    init(viewControllers: [UIViewController]? = nil) {
        guard let viewControllers = viewControllers else {
            
            let fundsNavigationController =
                SANavigationViewController(rootViewController: FundsViewController())
            
            let contactNavigationController =
                SANavigationViewController(rootViewController: ContactViewController())
            
            self.viewControllers = [fundsNavigationController,
                                    contactNavigationController]
            return
        }
        self.viewControllers = viewControllers
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
