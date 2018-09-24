//
//  InvestmentWorker.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

typealias InvestmentWorkerScreensHandler = (ScreenModel) -> Swift.Void
typealias InvestmentWorkerScreenFailure  = (NSError)-> Swift.Void

class InvestmentWorker {
    
    func fetchScreenInfo(completion : @escaping InvestmentWorkerScreensHandler, failure : @escaping InvestmentWorkerScreenFailure) {
        let requestable = InvestmentWorkerRequestable(request: InvestmentModels.Screen.Request())
        let request     : HTTRequest<ScreenModel> = HTTRequest(requestable: requestable)
        request.get(success: { response in
            guard let screen = response else {
                failure(NSError.generic)
                return
            }
            completion(screen)
        }, failure: { error in
            failure(error)
        })
    }
}

struct InvestmentWorkerRequestable : HTTPRequestable {
    
    var request : InvestmentModels.Screen.Request
    
    var url: URL {
        return URL(string: environment.host + path)!
    }
    
    var path: String {
        return "fund.json"
    }
    
    var params: [String : Any] {
        return [:]
    }
}
