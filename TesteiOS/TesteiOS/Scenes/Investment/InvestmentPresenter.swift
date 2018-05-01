//
//  InvestmentPresenter.swift
//  TesteiOS
//
//  Created by Ricardo Suman on 01/05/2018.
//  Copyright © 2018 Ricardo Suman. All rights reserved.
//

import UIKit

protocol InvestmentPresentationLogic: class {
    func presentFunds(response: Investment.FundsEntity)
}

class InvestmentPresenter: NSObject, InvestmentPresentationLogic {
    weak var viewController: InvestmentDisplayLogic?
    
    func presentFunds(response: Investment.FundsEntity) {
        viewController?.displayFund(viewModel: response)
    }
}
