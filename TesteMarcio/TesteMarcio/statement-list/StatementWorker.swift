
//
//  StatementWorker.swift
//  TesteMarcio
//
//  Created by marcio-mac on 29/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

protocol StatementWorkerProtocol {
    func LoadStatementList(user: UserAccount, completionBlock: @escaping (_ list: [Statement]) -> Void)
}

class StatementWorker: StatementWorkerProtocol {
    func LoadStatementList(user: UserAccount, completionBlock: @escaping (_ list: [Statement]) -> Void) {
        if let id = user.userId {
            StatementAPI.BuscarStatement(id: id) { (retorno) in
                completionBlock(retorno?.statementList ?? [])
            }
        }
    }
}
