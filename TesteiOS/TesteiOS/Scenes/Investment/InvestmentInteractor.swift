//
//  InvestmentInteractor.swift
//  TesteiOS
//
//  Created by Ricardo Suman on 01/05/2018.
//  Copyright © 2018 Ricardo Suman. All rights reserved.
//

import UIKit

protocol InvestmentBusinessLogic: class {
    func showFunds()
}

class InvestmentInteractor: NSObject, InvestmentBusinessLogic {
    var presenter: InvestmentPresentationLogic?
    
    func showFunds() {
        RestAPI.executeRequest(.fund, httpMethod: "GET") { [weak self] (responseData, response, responseError) in
            
            guard responseError == nil, let jsonData = responseData else {
                return
            }
            
            guard let fundsEntity = Investment.FundsEntity(jsonData: jsonData) else {
                return
            }
            
            DispatchQueue.main.async {
                self?.presenter?.presentFunds(response: fundsEntity)
            }
        }
    }
}
