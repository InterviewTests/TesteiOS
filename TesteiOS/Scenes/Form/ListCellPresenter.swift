//
//  ListCellPresenter.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 07/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import Foundation

protocol ListCellPresenterInput {
    func presentFetchResults(response: ListCell.Fetch.Response)
}

protocol ListCellPresenterOutput : class {
    func successFetchedItems(response: ListCell.Fetch.Response)
    func errorFetchingItems(response: ListCell.Fetch.Response)
}

class ListCellPresenter : ListCellPresenterInput {
    weak var output: ListCellPresenterOutput!
    
    func presentFetchResults(response: ListCell.Fetch.Response) {
        if !response.cells.isEmpty {
            if let output = self.output {
                output.successFetchedItems(response: response)
            }
        } else {
            if let output = self.output {
                output.errorFetchingItems(response: response)
            }
        }
    }
}
