//
//  InvestmentInteractor.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import Foundation

protocol InvestmentInteractorDelegate: BaseInteractorDelegate {
    
    func fundLoaded(_ fund: Fund)
}

class InvestmentInteractor: BaseInteractor {
    
    weak var delegate: InvestmentInteractorDelegate?
    
    func loadFund() {
        APIDataManager().request(endpoint: .fund, success: { [weak self] (response: FundScreen) in
            guard let fund = response.screen else { return }
            self?.delegate?.fundLoaded(fund)
        }, failure: { [weak self] (error) in
            self?.delegate?.error(nil, error)
        })
    }
}
