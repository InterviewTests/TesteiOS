//
//  InvestmentFundsInteractor.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 29/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation

protocol InvestmentFundsInteractorProtocol {
    func fetchFunds()
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
    
    func fetchFunds() {
        InvestmentFundsWorker.fetchInvestments(completion: { (responseData) in
            do {
                let fundsModel = try JSONDecoder().decode(Screen.self, from: responseData ?? Data())
                
                self.presenter?.handleFunds(funds: fundsModel.screen)
            } catch {
                print(error)
            }
        }) { (error) in
            
        }
    }
}
