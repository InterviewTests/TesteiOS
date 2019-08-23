//
//  InvestmentWorker.swift
//  Santander
//
//  Created by Orlando Amorim on 15/08/19.
//  Copyright (c) 2019 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Moya

protocol InvestmentStoreProtocol {
    func getFunds(result: @escaping (Result<Investment.Funds.Response, Error>) -> Void)
}

class InvestmentWorker {
    
    private let provider = MoyaProvider<ContactTarget>()
    
    var investmentStore: InvestmentStoreProtocol
    
    init(investmentStore: InvestmentStoreProtocol) {
        self.investmentStore = investmentStore
    }
    
    func getFunds(result: @escaping (Result<Investment.Funds.Response, Error>) -> Void) {
        investmentStore.getFunds(result: result)
    }
}
