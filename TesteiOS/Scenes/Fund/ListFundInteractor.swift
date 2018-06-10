//
//  ListFundInteractor.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 10/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import UIKit

protocol ListFundInteractorInput {
    func fetchItems()
}

protocol ListFundInteractorOutput {
    func presentFetchResults(response: ListFund.Fetch.Response)
}

class ListFundInteractor : ListFundInteractorInput {
    
    // Worker
    var worker : ListFundWorker!
    var output : ListFundInteractorOutput!
    
    func fetchItems() {
        worker = ListFundWorker()
        worker.list(completion: { (response) in
            self.output.presentFetchResults(response: response)
        }) { (error) in
            
        }
    }
}
