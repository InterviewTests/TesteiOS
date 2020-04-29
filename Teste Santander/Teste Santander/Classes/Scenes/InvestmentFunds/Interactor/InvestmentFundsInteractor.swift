//
//  InvestmentFundsInteractor.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 29/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation

protocol InvestmentFundsInteractorProtocol {
    
}

class InvestmentFundsInteractor: InvestmentFundsInteractorProtocol {
    // MARK: - Interface Properties
    var viewController: InvestmentFundsViewControllerProtocol?
    var presenter: InvestmentFundsPresenterProtocol?
    
    // MARK: - Initialization
    init(viewController: InvestmentFundsViewControllerProtocol, presenter: InvestmentFundsPresenterProtocol) {
        self.viewController = viewController
        self.presenter = presenter
    }
}
