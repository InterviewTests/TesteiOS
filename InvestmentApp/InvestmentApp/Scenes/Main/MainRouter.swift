//
//  MainRouter.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 22/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit
import SafariServices

protocol MainRouterLogic: class {
    func routerToSafari()
}

class MainRouter: MainRouterLogic {
    var viewController: MainViewController?
    
    func routerToSafari() {
        if let url = URL(string: "https://www.google.com") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let vc = SFSafariViewController(url: url, configuration: config)
            self.viewController?.present(vc, animated: true)
        }
    }
}

