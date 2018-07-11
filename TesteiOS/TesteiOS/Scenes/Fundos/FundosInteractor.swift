//
//  FundosInteractor.swift
//  TesteiOS
//
//  Created by lucas.eiji.saito on 28/06/18.
//  Copyright (c) 2018 Accenture. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FundosBusinessLogic
{
  func fetchFund(request: Fundos.Something.Request)
}

protocol FundosDataStore
{
  //var name: String { get set }
}

class FundosInteractor: FundosBusinessLogic, FundosDataStore
{
  var presenter: FundosPresentationLogic?
  var worker: FundosWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func fetchFund(request: Fundos.Something.Request)
  {
    worker = FundosWorker()
    worker?.fetchFund { (fund) -> Void in
        let response = Fundos.Something.Response(fund: fund)
        self.presenter?.presentFetchedFund(response: response)
    }
  }
}
