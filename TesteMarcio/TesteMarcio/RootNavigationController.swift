//
//  RootNavigationController.swift
//  TesteMarcio
//
//  Created by marcio-mac Rabelo on 28/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

import UIKit

class RootNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBarHidden(true, animated: false)
//        let loginViewController = LoginViewController(nibName: "LoginView", bundle: nil)
        let loginViewController = LoginViewController(nibName: "LoginView", bundle: Bundle.main, configurator: LoginConfigurator())
        
        setViewControllers([loginViewController], animated: true)
    }

}
