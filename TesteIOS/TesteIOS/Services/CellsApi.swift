//
//  CellsApi.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class CellsApi: CellsStoreProtocol {
    func fetchCells(completionHandler: @escaping ([CellModel], CellsStoreError?) -> Void) {
        let url = NetworkManager.baseURL + "cells.json"
        
        NetworkManager.requestURL(method: .get, url: url) { (response) in
            var cells: [CellModel] = []
            
            if let error = response.error {
                let error = CellsStoreError.CannotFetch(error.localizedDescription)
                completionHandler(cells, error)
                return
            }
            
            guard let data = response.data else {
                let error = CellsStoreError.CannotFetch("An error ocurred")
                completionHandler(cells, error)
                return
            }
            
            do {
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                if let jsonResult = jsonResult as? JSONDict {
                    if let cellsJson = jsonResult["cells"] as? [JSONDict] {
                        for json in cellsJson {
                            cells.append(CellModelFields(json: json))
                        }
                        
                        completionHandler(cells, nil)
                        return
                    }
                }
                
                let error = CellsStoreError.CannotFetch("An error ocurred")
                completionHandler(cells, error)
                return
            } catch let error {
                let error = CellsStoreError.CannotFetch(error.localizedDescription)
                completionHandler(cells, error)
                return
            }
        }
    }
}
