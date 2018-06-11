//
//  ListCellWorker.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 07/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import Foundation

typealias responseHandler = (_ response:ListCell.Fetch.Response) ->()

extension ListCellWorker {
    // Método para obter strings localizadas em arquivos tipo .string (rotas)
    func _route(str: String) -> String {
        return NSLocalizedString(str, comment: "")
    }
}

class ListCellWorker {
    func list(completion: @escaping(responseHandler), errorHandler: @escaping (responseHandler)){
        DispatchQueue.main.async {
            RequestAPI.sendGETRequest(urlMethod: self._route(str: "list_cell_route"), completion: { (data) in
                do {
                    // Parse da resposta para o modelo
                    let result = try JSONDecoder().decode(ListCell.Fetch.Response.self, from: data!)
                    completion(ListCell.Fetch.Response(cells: result.cells))
                } catch {
                    completion(ListCell.Fetch.Response(cells: []))
                }
                
            }) { (error) in
                completion(ListCell.Fetch.Response(cells: []))
            }
        }
    }
}
