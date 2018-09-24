//
//  InvestmentPresenter.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

protocol ScreenPresentation {
    func screenPresentation(response : InvestmentModels.Screen.Response)
}

class InvestmentPresenter: ScreenPresentation {

    weak var viewController : InvestmentDisplayScreen?
    
    func screenPresentation(response : InvestmentModels.Screen.Response) {
        let viewModel = InvestmentModels.Screen.ViewModel(screenModel: response.screenModel)
        viewController?.showViewModel(viewModel: viewModel)
    }
}
