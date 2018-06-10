//
//  ListFundPresenter.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 10/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import Foundation

protocol ListFundPresenterInput {
    func presentFetchResults(response: ListFund.Fetch.Response)
}

protocol ListFundPresenterOutput : class {
    func successFetchedItems(response: ListFund.Fetch.Response)
    func errorFetchingItems(response: ListFund.Fetch.Response)
}

class ListFundPresenter : ListFundPresenterInput {
    weak var output: ListFundPresenterOutput!
    
    func presentFetchResults(response: ListFund.Fetch.Response) {
       // if !response.screen.downInfo.isEmpty {
            if let output = self.output {
                output.successFetchedItems(response: response)
            }
        //} else {
        //    if let output = self.output {
        //        output.errorFetchingItems(response: response)
        //    }
        //}
    }
}
