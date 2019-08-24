//
//  AppCoordinator.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 24/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

protocol AppCoordinatorInterface {
    var window: UIWindow! {get set}
}

class AppCoordinator: AppCoordinatorInterface {
    var window: UIWindow!
    private(set) var navigationController: UINavigationController!
    
    init() {}
    
    func start() {}
}
