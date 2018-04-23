//
//  MainPresenter.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 22/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import Foundation

class MainPresenter {
    weak var viewController: MainViewControllerInput?
    
    func presentFund(fund: FundModel) {
        DispatchQueue.main.async {
            let viewModel = MainViewModel(fund: fund)
            self.viewController?.displayFunds(viewModel: viewModel)
        }
    }
    
    func presentError(error: NetworkResponse) {
        switch error{
        case .noInternetConnection:
            DispatchQueue.main.async {
                self.viewController?.displayError(status: ViewStatus.internetError({}))
            }
        default:
            DispatchQueue.main.async {
                self.viewController?.displayError(status: ViewStatus.requestError({}))
            }
        }
    }
}
