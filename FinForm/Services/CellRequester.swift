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
        if Connection.isInternetAvailable() == false{
            completionHandler(CellWorkerResult.Failure(error: CellWorkerError.NoInternetAcces))
            return
        }
        guard let url = URL.init(string: urlString) else{
            completionHandler(CellWorkerResult.Failure(error: CellWorkerError.WrongURLFormat))
            return
        }
        let request = URLRequest.init(url: url, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: TimeInterval.init(10))
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil{
                completionHandler(CellWorkerResult.Failure(error: CellWorkerError.CannotFetch(error!)))
            }
            if let data = data{
                if let cells:[Cell] = self.parseCell(data: data){
                    completionHandler(CellWorkerResult.Success(result: cells))
                } else{
                    completionHandler(CellWorkerResult.Failure(error: CellWorkerError.ParseError))
                }
            } else{
                completionHandler(CellWorkerResult.Failure(error: CellWorkerError.NoData))
            }
        }
        task.resume()
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
