//
//  FundsPresenter.swift
//  TesteIOS
//
//  Created by Sidney Silva on 15/06/2018.
//  Copyright (c) 2018 Sakura Soft. All rights reserved.
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
