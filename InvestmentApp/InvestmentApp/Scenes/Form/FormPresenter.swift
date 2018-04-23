//
//  FormPresenter.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 21/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import Foundation

class FormPresenter {
    weak var viewController: FormViewControllerInput?
    
    func presentForm(cells: [CellModel]) {
        DispatchQueue.main.async {
            let viewModel = FormViewModel(cells: cells)
            self.viewController?.displayForm(viewModel: viewModel)
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
