//
//  ShowFundsPresenter.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright (c) 2018 Felipe Borges. All rights reserved.
//
//

import UIKit

protocol ShowFundsPresentationLogic {
  func present(response: ShowFunds.Funds.Response)
}

class ShowFundsPresenter: ShowFundsPresentationLogic {
  weak var viewController: ShowFundsDisplayLogic?
    
  func present(response: ShowFunds.Funds.Response)  {
    switch response {
    case .error(error: _):
        self.viewController?.displayError()
    case .success(data: let info):
        let viewModel = ShowFunds.Funds.ViewModel(info: info)
        self.viewController?.display(viewModel: viewModel)
    }
  }
}
