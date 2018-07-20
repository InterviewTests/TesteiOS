//
//  ScreenWorker.swift
//  FinForm
//
//  Created by Gustavo on 20/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

import Foundation

class ScreenWorker{
    
    var screenEngine:ScreenWorkerProtocol
    
    init(screenEngine: ScreenWorkerProtocol)
    {
        self.screenEngine = screenEngine
    }
    
    func fetchScreen(completionHandler: @escaping FetchScreenCompletionHandler){
        self.screenEngine.fetchScreen { (result) in
            completionHandler(result)
        }
    }
    
}

// MARK: - Protocols
protocol ScreenWorkerProtocol {
    func fetchScreen(completionHandler: @escaping FetchScreenCompletionHandler)
}

// MARK: - Typealias
typealias FetchScreenCompletionHandler = (ScreenWorkerResult<[Screen]>) -> Void

// MARK: - Results
enum ScreenWorkerResult<U>
{
    case Success(result: U)
    case Failure(error: ScreenWorkerError)
}

// MARK: - Erros
enum ScreenWorkerError: Error
{
    case CannotFetch(Error)
    case NoInternetAcces
    case WrongURLFormat
    case NoData
    case ParseError
    case Default
}
