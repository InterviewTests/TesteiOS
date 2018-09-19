//
//  FormRouter.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 18/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation
import UIKit

protocol FormRouterLogic: class {
    func routerToMain()
}

class FormRouter: FormRouterLogic {
    var viewController: FormViewController?
    
    func routerToMain() {
        let mainViewController = FundViewController()
        viewController?.navigationController?.pushViewController(mainViewController, animated: true)
    }
}
