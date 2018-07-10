//
//  CellInteractor.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import Foundation

protocol CellsBusinessLogic {
    func fetchCells(request: Cells.FetchCells.Request)
}

protocol CellsDataStore {
    var cells: [Cell]? { get }
}

class CellsInteractor: CellsBusinessLogic, CellsDataStore {
    var presenter: CellsPresentationLogic?
    var cellsWorker = CellsWorker(cellsStore: CellsAPI())
    
    var cells: [Cell]?
    
    // MARK: - Fetch orders
    
    func fetchCells(request: Cells.FetchCells.Request) {
        cellsWorker.fetchCells { (cells) -> Void in
            self.cells = cells
            let response = Cells.FetchCells.Response(cells: cells)
            self.presenter?.presentFetchedCells(response: response)
        }
    }
}
