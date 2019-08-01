//
//  StatementInteractor.swift
//  TesteMarcio
//
//  Created by marcio-mac on 29/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

protocol StatementInteractorBusinessLogic {
    func handleLoadStatementList(request: StatementModel.loadStatementList.request)
}

class StatementInteractor: StatementInteractorBusinessLogic {
    
    var presenter: StatementPresenterPresentationLogic?
    var worker: StatementWorkerProtocol?
    
    func handleLoadStatementList(request: StatementModel.loadStatementList.request) {
        worker?.LoadStatementList(user: request.user, completionBlock: { list in
            self.presenter?.presentStatementList(statementList: list)
        })
    }
}
