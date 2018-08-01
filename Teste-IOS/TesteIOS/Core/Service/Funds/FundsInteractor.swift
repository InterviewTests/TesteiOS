//
//  FundsInteractor.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//


import UIKit

protocol FundsBusinessLogic {
    func fetch(request: FundsModel.Fetch.Request)
}

class FundsInteractor: FundsBusinessLogic {
    
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
