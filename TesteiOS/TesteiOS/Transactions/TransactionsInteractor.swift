//
//  TransactionsInteractor.swift
//  TesteiOS
//
//  Created by Gabriel Soria Souza on 22/10/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import UIKit

protocol GetTransactions {
    func getTransactions()
}

protocol TransactionsOfUserWithId {
    var id: Int? { get set }
}

class TransactionsInteractor: GetTransactions, TransactionsOfUserWithId {
    
    var presenter: GetTransactionsPresenter?
    var id: Int?
    var statementRequest: StatementsRequest?
    
    func getTransactions() {
        guard let newId = id else { return }
        RequestAndPostData.getData(id: newId, completion: { (statement: StatementsRequest) in
                self.statementRequest = StatementsRequest.init(statementList: statement.statementList, error: statement.error)
                guard let list = self.statementRequest?.statementList else { return }
            DispatchQueue.main.async {
                self.presenter?.getTransactions(statementRequestList: list)
            }
        }) { (error) in
            print(error)
        }
    }
}
