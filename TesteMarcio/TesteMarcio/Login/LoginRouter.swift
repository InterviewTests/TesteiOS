//
//  LoginRouter.swift
//  TesteMarcio
//
//  Created by marcio-mac Rabelo on 28/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

import UIKit

protocol LoginProtocolRoutingLogic {
    func routToStatementScreen(withUser user: UserAccount)
}

class LoginRouter: LoginProtocolRoutingLogic {
    
    var viewController: (UIViewController & LoginViewControllerDisplayLogic)?
    
    func routToStatementScreen(withUser user: UserAccount) {
        
        let transactionsViewController = StatementListViewController(nibName: "StatementView", bundle: Bundle.main, configurator: StatementConfigurator())
        transactionsViewController.user = user
        
        viewController?.navigationController?.pushViewController(transactionsViewController, animated: true)
        
    }
}
