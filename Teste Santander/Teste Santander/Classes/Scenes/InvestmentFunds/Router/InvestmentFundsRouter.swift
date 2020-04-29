//
//  InvestmentFundsRouter.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 29/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation

class InvestmentFundsRouter {
    public static func rootViewController() -> InvestmentFundsViewController {
        let investmentFunds = InvestmentFundsViewController.loadFromNib()
        let investmentFundsPresenter = InvestmentFundsPresenter(viewController: investmentFunds)
        let investmentFundsInteractor = InvestmentFundsInteractor(viewController: investmentFunds, presenter: investmentFundsPresenter)
        
        investmentFunds.interactor = investmentFundsInteractor
        
        return investmentFunds
    }
}
