//
//  StatementPresenter.swift
//  TesteMarcio
//
//  Created by marcio-mac on 29/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

protocol StatementPresenterPresentationLogic {
    func presentStatementList(statementList: [Statement])
}

class StatementPresenter: StatementPresenterPresentationLogic {
    
    var viewController: StatementViewControllerDisplayLogic?
    
    func presentStatementList(statementList: [Statement]) {
        viewController?.displayLoadStatementList(viewObject: StatementModel.loadStatementList.viewObject(statementList: statementList))
    }
}
