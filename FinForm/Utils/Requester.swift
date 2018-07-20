//
//  Requester.swift
//  FinForm
//
//  Created by Gustavo on 20/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

import Foundation

class Requester{
    
    static func simpleRequest(urlString:String,completionHandler: @escaping RequesterSimpleRequestCompletionHandler){
        if Connection.isInternetAvailable() == false{
            completionHandler(RequesterResult.Failure(error: RequesterError.NoInternetAcces))
            return
        }
        guard let url = URL.init(string: urlString) else{
            completionHandler(RequesterResult.Failure(error: RequesterError.WrongURLFormat))
            return
        }
        let request = URLRequest.init(url: url, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: TimeInterval.init(10))
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil{
                completionHandler(RequesterResult.Failure(error: RequesterError.CannotFetch(error!)))
            }
            if let data = data{
                completionHandler(RequesterResult.Success(data: data))
            } else{
                completionHandler(RequesterResult.Failure(error: RequesterError.NoData))
            }
        }
        task.resume()
    }
    
}

// MARK: - Typealias
typealias RequesterSimpleRequestCompletionHandler = (RequesterResult) -> Void

// MARK: - Results
enum RequesterResult
{
    case Success(data: Data)
    case Failure(error: RequesterError)
}

// MARK: - Erros
enum RequesterError: Error
{
    case CannotFetch(Error)
    case NoInternetAcces
    case WrongURLFormat
    case NoData
    case Default
}
