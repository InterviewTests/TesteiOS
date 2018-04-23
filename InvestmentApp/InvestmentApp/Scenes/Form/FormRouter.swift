//
//  FormRouter.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 22/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

protocol FormRouterLogic: class {
    func routerToMain()
}

class FormRouter: FormRouterLogic {
    var viewController: FormViewController?
    
    func routerToMain() {
        let mainViewController = MainViewController()
        viewController?.navigationController?.pushViewController(mainViewController, animated: true)
    }
}
