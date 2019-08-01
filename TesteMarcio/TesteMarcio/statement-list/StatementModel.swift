//
//  StatementModel.swift
//  TesteMarcio
//
//  Created by marcio-mac on 29/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

import Foundation

enum StatementModel{
    
    enum loadStatementList {
        struct request {
            let user: UserAccount
        }
        struct response {
            let statementList: [Statement]
        }
        struct viewObject {
            let statementList: [Statement]
        }
    }
    
    enum ActivityIndicator {
        struct Request { }
        struct Response { }
        struct ViewObject { }
    }
}
