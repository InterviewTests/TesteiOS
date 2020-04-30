//
//  InvestmentFundsInteractor.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 29/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation

protocol InvestmentFundsInteractorProtocol {
    /// Requests Funds Object
    func fetchFunds()
}

class InvestmentFundsInteractor: InvestmentFundsInteractorProtocol {

    // MARK: - Interface Properties
    var viewController: InvestmentFundsViewControllerProtocol?
    var presenter: InvestmentFundsPresenterProtocol?
    var investmentFundsWorker: InvestmentFundsWorkerProtocol?
    
    // MARK: - Initialization
    init(viewController: InvestmentFundsViewControllerProtocol, presenter: InvestmentFundsPresenterProtocol) {
        self.viewController = viewController
        self.presenter = presenter
        
        investmentFundsWorker = InvestmentFundsWorker()
    }
    
    // MARK: - InvestmentFundsInteractorProtocol
    func fetchFunds() {
        viewController?.startLoading()
        investmentFundsWorker?.fetchInvestments(completion: { (responseData) in
            self.viewController?.stopLoading()
            
            do {
                let fundsModel = try JSONDecoder().decode(Screen.self, from: responseData ?? Data())
                
                self.presenter?.handleFunds(funds: InvestmentFundsViewModel(funds: fundsModel.screen))
            } catch {
                print(error)
            }
        }) { (error) in
            self.viewController?.stopLoading()
            self.presenter?.handleError(error: error)
        }
    }
}
