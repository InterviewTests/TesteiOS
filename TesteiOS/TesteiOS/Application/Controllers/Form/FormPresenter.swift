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
}

class FormPresenter: NSObject, FormInteractorOutput {
    
    weak var output: FormPresenterProtocol?
    
    //MARK: FormInteractorOutput
    func resultForm(cellList:[CellList]) {
        if cellList.count > 0 {
            self.output?.loadForm(listCell: cellList)
        }
        self.output?.failureView(msg: "Ops... Aconteceu alguma coisa de errada.")
    }
    
    func failure(msg:String) {
        self.output?.failureView(msg: msg)
    }
    
}
