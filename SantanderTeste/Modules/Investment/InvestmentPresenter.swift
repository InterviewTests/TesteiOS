//
//  InvestmentPresenter.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import Foundation

protocol InvestmentPresenterDelegate: BasePresenterDelegate {
    
    func loadUI(_ fund: Fund)
}

class InvestmentPresenter: BasePresenter {
    
    weak var delegate: InvestmentPresenterDelegate?
    var interactor: InvestmentInteractor?
    
    func loadUIIfNeeded() {
        delegate?.loading(true)
        
        interactor?.loadFund()
    }
}

extension InvestmentPresenter: InvestmentInteractorDelegate {
    
    func error(_ title: String?, _ error: String) {
        delegate?.loading(false)
        
        delegate?.error(nil, error)
    }

    func fundLoaded(_ fund: Fund) {
        delegate?.loading(false)
        
        delegate?.loadUI(fund)
    }
}
