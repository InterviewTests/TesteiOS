//
//  AddContactInteractor.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 23/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

class AddContactInteractor: NSObject {
    
    var presenter : AddContactPresenter?
    private var worker : AddContactWorker?
    
    
    override init() {
        super.init()
        self.presenter  = AddContactPresenter()
        self.worker     = AddContactWorker()
    }
    
    func doLoadCells() {
        worker?.fetchCells(completion: { cells in
            let response = AddContactModels.Cells.Response(cells: cells)
            self.presenter?.cellsPresentation(response: response)
        }, failure: { error in
            
        })
    }
}
