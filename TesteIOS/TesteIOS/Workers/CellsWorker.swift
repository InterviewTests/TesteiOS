//
//  CellsWorker.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class CellsWorker {
    var cellsStore: CellsStoreProtocol
    
    init(cellsStore: CellsStoreProtocol){
        self.cellsStore = cellsStore
    }
    
    func fetchCells(completionHandler: @escaping([CellModel], CellsStoreError?) -> Void) {
        cellsStore.fetchCells { (cells, error) in
            completionHandler(cells, error)
        }
    }
}

protocol CellsStoreProtocol {
    func fetchCells(completionHandler: @escaping([CellModel], CellsStoreError?) -> Void)
}

enum CellsStoreError: Error {
    case CannotFetch(String)
}
