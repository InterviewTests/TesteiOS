//
//  ShowInvestmentInteractor.swift
//  Profile
//
//  Created by Renee Alves on 28/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation

protocol InvestmentLogic {
    func fetchData()
}

class ShowInvestmentInteractor: InvestmentLogic {
    
    var presenter: ShowInvestmentPresenter?
    var worker: InvestmentWorker?
    
    func fetchData() {
        
        worker = InvestmentWorker()
        
        worker?.getInvestmentData(callback: { (displayedInvestment) in
            
            self.presenter?.presentInvestment(response: displayedInvestment!)
        })
    }
}
