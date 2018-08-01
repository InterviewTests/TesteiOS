//
//  FundsPresenter.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//


import UIKit

protocol FundsPresentationLogic {
    func display(response: FundsModel.Fetch.Response)
}

class FundsPresenter: FundsPresentationLogic {

    weak var viewController: FundsDisplayLogic?
  
    func display(response: FundsModel.Fetch.Response) {
        let viewModel = FundsModel.Fetch.ViewModel(screen: response.screen, error: response.error)
        viewController?.display(viewModel: viewModel)
    }
}
