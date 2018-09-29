//
//  ShowInvestmentPresenter.swift
//  Profile
//
//  Created by Renee Alves on 28/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation

protocol ShowInvestmentPresentationLogic
{
    func presentInvestment(response: ShowInvestment.GetInvestment.ViewModel.DisplayedInvestment)
}

class ShowInvestmentPresenter: ShowInvestmentPresentationLogic {
    
    weak var view: InvestmentViewController?
    
    func presentInvestment(response: ShowInvestment.GetInvestment.ViewModel.DisplayedInvestment) {
        
        view?.displayInvestment(displayedInvestment: response)
    }
}
