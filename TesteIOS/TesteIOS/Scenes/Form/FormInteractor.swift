//
//  FormInteractor.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

protocol FormBusinessLogic {
    func fetchCells(request: Form.FetchCells.Request)
}

protocol FormDataStore {
    var cells: [CellModel]? { get }
}

class FormInteractor: FormBusinessLogic, FormDataStore {
    var presenter: FormPresentationLogic?
    var formWorker = CellsWorker(cellsStore: CellsApi())
    
    var cells: [CellModel]?
    
    func fetchCells(request: Form.FetchCells.Request) {
        formWorker.fetchCells { (cells, error) in
            self.cells = cells
            let response = Form.FetchCells.Response(cells: cells, error: error)
            self.presenter?.presentFetchedCells(response: response)
        }
    }
}
