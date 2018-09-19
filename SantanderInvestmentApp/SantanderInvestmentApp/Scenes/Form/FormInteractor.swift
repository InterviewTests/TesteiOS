//
//  FormInteractor.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 18/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation

class FormInteractor {
    var worker: FormWorker
    var presenter: FormPresenter?
    
    init(worker: FormWorker = FormWorker(), presenter: FormPresenter = FormPresenter()) {
        self.worker = worker
        self.presenter = presenter
    }
    
    func fetchForm() {
        worker.getForm(completion: { cells in
            self.presenter?.presentForm(cells: cells)
        }, failure: { error in
            self.presenter?.presentError(error: error)
        })
    }
}
