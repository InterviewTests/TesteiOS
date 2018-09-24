//
//  InvestmentRouter.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

protocol InvestmentRouterLogic {
    func routerToAddContact()
}

class InvestmentRouter : InvestmentRouterLogic {
    
    weak var viewController : InvestmentViewController?
    
    func routerToAddContact() {
        self.viewController?.navigationController?.pushViewController(AddContactViewController(), animated: true)
    }
    
}
