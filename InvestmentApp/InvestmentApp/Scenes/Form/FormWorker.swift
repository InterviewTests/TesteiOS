//
//  FormWorker.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 21/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import Foundation

class FormWorker {
    let manager: NetworkManager
    
    init(manager: NetworkManager = NetworkManager()) {
        self.manager = manager
    }
    
    func getForm(success: @escaping (_ cells: [CellModel]) -> (),
                   failure: @escaping (_ error: NetworkResponse) -> ()) {
        manager.request(request: InvestmentAPI.cells, success: { (cells: CellsModel) in
            success(cells.cells)
        }) { (error) in
            failure(error)
        }
    }
}

