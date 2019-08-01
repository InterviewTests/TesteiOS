//
//  StatementRouter.swift
//  TesteMarcio
//
//  Created by marcio-mac on 29/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

import UIKit

protocol StatementRouterRoutingLogic {
    func logout(viewController: UIViewController)
}

class StatementRouter: StatementRouterRoutingLogic {
    
    var viewController: (UIViewController & StatementViewControllerDisplayLogic)?
    
    func logout(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
    
}
