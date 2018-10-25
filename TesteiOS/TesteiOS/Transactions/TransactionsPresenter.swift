//
//  TransactionsPresenter.swift
//  TesteiOS
//
//  Created by Gabriel Soria Souza on 22/10/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import UIKit

protocol GetTransactionsPresenter {
    func getTransactions(statementRequestList: [StatementListRequest])
}

class TransactionsPresenter: GetTransactionsPresenter {

    weak var viewController: UserTransactionsViewController?
    
    func getTransactions(statementRequestList: [StatementListRequest]) {
        
        viewController?.data = statementRequestList
        viewController?.finishLoadingContent()
        
    }
}
