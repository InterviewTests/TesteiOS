//
//  MainInteractor.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 22/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import Foundation

class MainInteractor {
    var worker: MainWorker
    var presenter: MainPresenter?
    
    init(worker: MainWorker = MainWorker(), presenter: MainPresenter = MainPresenter()) {
        self.worker = worker
        self.presenter = presenter
    }
    
    func fetchFund() {
        worker.getFund(success: { (fund) in
            self.presenter?.presentFund(fund: fund)
        }) { (error) in
            self.presenter?.presentError(error: error)
        }
    }
}

