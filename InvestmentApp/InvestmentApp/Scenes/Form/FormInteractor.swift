//
//  FormInteractor.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 21/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
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
        worker.getForm(success: { (cells) in
            self.presenter?.presentForm(cells: cells)
        }) { (error) in
            self.presenter?.presentError(error: error)            
        }
    }
}
