//
//  FundsInteractor.swift
//  TesteIOS
//
//  Created by Sidney Silva on 15/06/2018.
//  Copyright (c) 2018 Sakura Soft. All rights reserved.
//


import UIKit

protocol FundsBusinessLogic {
    func fetch(request: FundsModel.Fetch.Request)
}

protocol FundsDataStore {
    //var name: String { get set }
}

class FundsInteractor: FundsBusinessLogic, FundsDataStore {
    
    var presenter: FundsPresentationLogic?
    var worker: FundsWorker?

    func fetch(request: FundsModel.Fetch.Request) {
        worker = FundsWorker()
        worker?.fetchForm(url: request.url!, success: { (success) in
            let response = FundsModel.Fetch.Response(screen: success.screen, error: success.error, message: success.message)
            self.presenter?.display(response: response)
        }, failure: { (failure) in
            let response = FundsModel.Fetch.Response(screen: failure.screen, error: failure.error, message: failure.message)
            self.presenter?.display(response: response)
        })
    }

}
