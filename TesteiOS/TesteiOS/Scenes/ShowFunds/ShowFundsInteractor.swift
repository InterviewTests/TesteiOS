//
//  ShowFundsInteractor.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright (c) 2018 Felipe Borges. All rights reserved.
//
//

import UIKit

protocol ShowFundsBusinessLogic
{
  func requestData(request: ShowFunds.Funds.Request)
}

class ShowFundsInteractor: ShowFundsBusinessLogic {
  var presenter: ShowFundsPresentationLogic?
  var worker: ShowFundsWorker?
  //var name: String = ""
  
  func requestData(request: ShowFunds.Funds.Request) {
    worker = ShowFundsWorker()
    worker?.request(url: request.url, completion: { response in
        self.presenter?.present(response: response)
    })
  }
}
