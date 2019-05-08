//
//  FormPresenter.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation

protocol FormPresenterProtocol: class {
    func loadForm(listCell:[CellList])    
    func failureView(msg:String)
    func successValidate()
}

class FormPresenter: NSObject, FormInteractorOutput {
    
    weak var output: FormPresenterProtocol?
    
    //MARK: FormInteractorOutput
    func resultForm(cellList:[CellList]) {
        self.output?.loadForm(listCell: cellList)
    }
    
    func failure(msg:String) {
        self.output?.failureView(msg: msg)
    }
    
    func validateSuccess() {
        self.output?.successValidate()
    }
    
}
