//
//  InvestmentFundsPresenter.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 29/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation

protocol InvestmentFundsPresenterProtocol {
    
}

class InvestmentFundsPresenter: InvestmentFundsPresenterProtocol {
    // MARK: - Interface Properties
    var viewController: InvestmentFundsViewControllerProtocol?
    
    // MARK: - Initialization
    init(viewController: InvestmentFundsViewControllerProtocol) {
        self.viewController = viewController
    }
}
