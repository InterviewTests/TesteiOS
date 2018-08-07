//
//  FundosDetailsInteractor.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 06/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

protocol FundosDetailsBusinessLogic {
    func fetchFundo(request: FundosDetails.GetFund.Request)
}

protocol FundosDetailsDataStore {
    var fund: FundModel? { get }
}

class FundosDetailsInteractor: FundosDetailsBusinessLogic, FundosDetailsDataStore {
    var presenter: FundosDetailsPresentationLogic?
    var fundosWorker = FundosWorker(fundosStore: FundsApi())
    
    var fund: FundModel?
    
    func fetchFundo(request: FundosDetails.GetFund.Request) {
        fundosWorker.fetchFundo { (fund, error) in
            self.fund = fund
            let response = FundosDetails.GetFund.Response(fundo: fund, error: error)
            self.presenter?.presentFundo(response: response)
        }
    }
}
