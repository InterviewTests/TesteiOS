//
//  ListFundWorker.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 10/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import Foundation

typealias responseFundHandler = (_ response:ListFund.Fetch.Response) ->()

extension ListFundWorker {
    // Método para obter strings localizadas em arquivos tipo .string (rotas)
    func _route(str: String) -> String {
        return NSLocalizedString(str, comment: "")
    }
}

class ListFundWorker {
    func list(completion: @escaping(responseFundHandler), errorHandler: @escaping (responseFundHandler)){
        RequestAPI.sendGETRequest(urlMethod: self._route(str: "list_fund_route"), completion: { (data) in
            do {
                // Parse da resposta para o modelo
                let result = try JSONDecoder().decode(ListFund.Fetch.Response.self, from: data!)
                completion(result)
            } catch let e as Error {
            }
            
        }) { (error) in
            
        }
    }
}
