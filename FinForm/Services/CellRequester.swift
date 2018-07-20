//
//  CellRequester.swift
//  FinForm
//
//  Created by Gustavo on 20/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

import Foundation

class CellRequester: CellWorkerProtocol{
    
    private let urlString:String = "https://floating-mountain-50292.herokuapp.com/cells.json"
    
    func fetchCells(completionHandler: @escaping FetchCellCompletionHandler) {
       Requester.simpleRequest(urlString: urlString) { (result) in
            switch result{
            case .Success(data: let data):
                if let cells:[Cell] = self.parseCell(data: data){
                    completionHandler(CellWorkerResult.Success(result: cells))
                } else{
                    completionHandler(CellWorkerResult.Failure(error: CellWorkerError.ParseError))
                }
            case .Failure(error: let error):
                completionHandler(CellWorkerResult.Failure(error: CellWorkerError.RequestError(error)))
            }
        }
    }
    
    private func parseCell(data: Data) -> [Cell]?{
        do{
            let cellsRoot = try JSONDecoder().decode(RootCells.self, from: data)
            return cellsRoot.cells
        } catch{
            return nil
        }
    }
}
