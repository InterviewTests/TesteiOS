//
//  ScreenRequester.swift
//  FinForm
//
//  Created by Gustavo on 20/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

import Foundation

class ScreenRequester: ScreenWorkerProtocol{
    
    private let urlString:String = "https://floating-mountain-50292.herokuapp.com/fund.json"
    
    func fetchScreen(completionHandler: @escaping FetchScreenCompletionHandler) {
        if Connection.isInternetAvailable() == false{
            completionHandler(ScreenWorkerResult.Failure(error: ScreenWorkerError.NoInternetAcces))
            return
        }
        guard let url = URL.init(string: urlString) else{
            completionHandler(ScreenWorkerResult.Failure(error: ScreenWorkerError.WrongURLFormat))
            return
        }
        let request = URLRequest.init(url: url, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: TimeInterval.init(10))
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil{
                completionHandler(ScreenWorkerResult.Failure(error: ScreenWorkerError.CannotFetch(error!)))
            }
            if let data = data{
                if let screen:Screen = self.parseCell(data: data){
                    completionHandler(ScreenWorkerResult.Success(result: screen))
                } else{
                    completionHandler(ScreenWorkerResult.Failure(error: ScreenWorkerError.ParseError))
                }
            } else{
                completionHandler(ScreenWorkerResult.Failure(error: ScreenWorkerError.NoData))
            }
        }
        task.resume()
    }
    
    private func parseCell(data: Data) -> Screen?{
        do{
            let screenRoot = try JSONDecoder().decode(RootScreen.self, from: data)
            return screenRoot.screen
        } catch{
            return nil
        }
    }
}
