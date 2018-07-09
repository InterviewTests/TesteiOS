//
//  FundInteractor.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import Foundation

protocol FundsBusinessLogic
{
    func fetchFunds(request: Funds.FetchFunds.Request)
}

protocol FundsDataStore
{
    var funds: [Fund]? { get }
}

class FundsInteractor: FundsBusinessLogic, FundsDataStore
{
    var presenter: FundsPresentationLogic?
    var fundsWorker = FundsWorker(fundsStore: FundsAPI())
    
    var funds: [Fund]?
    
    // MARK: - Fetch orders
    
    func fetchFunds(request: Funds.FetchFunds.Request)
    {
        fundsWorker.fetchFunds { (funds) -> Void in
            self.funds = funds
            let response = Funds.FetchFunds.Response(funds: funds)
            self.presenter?.presentFetchedFunds(response: response)
        }
    }
}
