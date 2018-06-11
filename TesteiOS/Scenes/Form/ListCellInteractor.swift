//
//  ListCellInteractor.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 07/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import UIKit

protocol ListCellInteractorInput {
    func fetchItems()
}

protocol ListCellInteractorOutput {
    func presentFetchResults(response: ListCell.Fetch.Response)
}

class ListCellInteractor : ListCellInteractorInput {
    
    // Worker
    var worker : ListCellWorker!
    var output : ListCellInteractorOutput!
    
    func fetchItems() {
        worker = ListCellWorker()
        worker.list(completion: { (response) in
            self.output.presentFetchResults(response: response)
        }) { (error) in
            self.output.presentFetchResults(response: ListCell.Fetch.Response(cells: []))
        }
    }
}
