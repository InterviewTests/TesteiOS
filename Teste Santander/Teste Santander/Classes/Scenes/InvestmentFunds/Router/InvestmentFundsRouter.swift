//
//  InvestmentFundsRouter.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 29/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation
import SafariServices

class InvestmentFundsRouter {
    /// Requests Investment Funds Screen Instance
    /// - Returns: Investment Funds Screen Instance
    public static func rootViewController() -> InvestmentFundsViewController {
        let investmentFunds = InvestmentFundsViewController.loadFromNib()
        let investmentFundsPresenter = InvestmentFundsPresenter(viewController: investmentFunds)
        let investmentFundsInteractor = InvestmentFundsInteractor(viewController: investmentFunds, presenter: investmentFundsPresenter)
        
        investmentFunds.interactor = investmentFundsInteractor
        
        return investmentFunds
    }
    
    /// Requests Safari View Controller
    /// - Parameter initialViewController: initial View Controller for navigation
    public static func openSafariViewController(initialViewController: InvestmentFundsViewController) {
        let url = URL(string: APIConstants.downloadUrl)!
        let controller = SFSafariViewController(url: url)
        initialViewController.present(controller, animated: true, completion: nil)
    }
}
