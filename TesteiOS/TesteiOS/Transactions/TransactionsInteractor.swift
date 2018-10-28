//
//  TransactionsInteractor.swift
//  TesteiOS
//
//  Created by Gabriel Soria Souza on 22/10/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import UIKit

protocol GetTransactions {
    func getTransactions(userTransactionsViewController: UserTransactionsViewController)
}

protocol TransactionsOfUserWithId {
    var id: Int? { get set }
}

class TransactionsInteractor: GetTransactions, TransactionsOfUserWithId {
    
    var presenter: GetTransactionsPresenter?
    var id: Int?
    var statementRequest: StatementsRequest?
    
    func getTransactions(userTransactionsViewController: UserTransactionsViewController) {
        guard let newId = id else { return }
        RequestAndPostDataWorker.getData(id: newId, completion: { (statement: StatementsRequest) in
                self.statementRequest = StatementsRequest.init(statementList: statement.statementList, error: statement.error)
                guard let list = self.statementRequest?.statementList else { return }
            DispatchQueue.main.async {
                self.presenter?.getTransactions(statementRequestList: list)
            }
        }) { (error) in
            let ac = UIAlertController(title: "Ops!", message: "Erro ao carregar seus dados, verifique sua conexão ou tente mais tarde", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert) in
                self.presenter?.dismissViewController(viewController: userTransactionsViewController)
                
            }))
        }
    }
}
