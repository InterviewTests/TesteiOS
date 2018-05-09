//
//  FormPresenter.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 09/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import Foundation

protocol FormProtocol:BaseView {
    
    func updateWithLoadedFormCells()
}

class FormPresender: BasePresenter {
    var view: FormProtocol
    var service: FormService
    
    typealias V = FormProtocol
    typealias S = FormService
    
    var form:Cells!
    
    var numberOfItems:Int{
        return form.cells.count
    }
    
    func getCellForIndex(index:Int)->Cell{
        return form.cells[index]
    }
    

    init(service:FormService,view:FormProtocol) {
        self.service = service
        self.view = view
    }

    func loadForm(){
        view.showLoading()
        service.load { (result) in
            self.view.hideLoading()
            switch result{
            case .success(let statusCode,let form):
                print(form,statusCode)
                self.form = form
                self.view.updateWithLoadedFormCells()
            case .error(let error):
                print(error)
                self.view.showDefaultError()
            }
        }
    }
    
    
}

