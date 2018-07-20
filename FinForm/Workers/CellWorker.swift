//
//  CellWorker.swift
//  FinForm
//
//  Created by Gustavo on 20/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

import Foundation

class CellWorker{
    
    var cellEngine:CellWorkerProtocol
    
    init(cellEngine: CellWorkerProtocol)
    {
        self.cellEngine = cellEngine
    }
    
    func fetchCells(completionHandler: @escaping FetchCellCompletionHandler){
        self.cellEngine.fetchCells { (result) in
            completionHandler(result)
        }
    }
    
}

// MARK: - Protocols
protocol CellWorkerProtocol {
    func fetchCells(completionHandler: @escaping FetchCellCompletionHandler)
}

// MARK: - Typealias
typealias FetchCellCompletionHandler = (CellWorkerResult<[Cell]>) -> Void

// MARK: - Results
enum CellWorkerResult<U>
{
    case Success(result: U)
    case Failure(error: CellWorkerError)
}

// MARK: - Erros
enum CellWorkerError: Equatable, Error
{
    case CannotFetch(String)
    case NoInternetAcces
    case WrongURLFormat
    case NoData
    case ParseError(String)
    case Default
}
