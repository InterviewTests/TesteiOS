//
//  FormPresenter.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 18/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
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
    
    func presentError(error: NetworkErrorResponse) {
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
