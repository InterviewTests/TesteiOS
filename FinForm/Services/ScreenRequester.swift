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
        Requester.simpleRequest(urlString: urlString) { (result) in
            switch result{
            case .Success(data: let data):
                if let screen:Screen = self.parseCell(data: data){
                    completionHandler(ScreenWorkerResult.Success(result: screen))
                } else{
                    completionHandler(ScreenWorkerResult.Failure(error: ScreenWorkerError.ParseError))
                }
            case .Failure(error: let error):
                completionHandler(ScreenWorkerResult.Failure(error: ScreenWorkerError.RequestError(error)))
            }
        }
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
