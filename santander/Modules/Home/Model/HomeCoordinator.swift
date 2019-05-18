//
//  HomeCoordinator.swift
//  santander
//
//  Created by Jonatha Lima on 18/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

protocol Funding: AnyObject {
    func invest()
}

protocol Contacting: AnyObject {
    func contact()
}

public class HomeCoordinator: Coordinator {
    
    public var viewControllers: [UIViewController]
    
    init(viewControllers: [UIViewController]? = nil) {
        guard let viewControllers = viewControllers else {
            self.viewControllers = [FundsViewController(),
                                    ContactViewController()]
            return
        }
        self.viewControllers = viewControllers
    }
    
    public func start() {}
    
}

extension HomeCoordinator: Funding {
    
    func invest() {
        // TODO: Start funds coordinator
    }
    
}

extension HomeCoordinator: Contacting {
    func contact() {
        // TODO: Start contact coordinator
    }
    
    
}
