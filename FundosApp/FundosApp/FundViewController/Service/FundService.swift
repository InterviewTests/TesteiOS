//
//  FundService.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 08/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import Foundation

protocol FundService {
    typealias FundServiceCompletionHandler = (ResultHelper<Funds>) -> Void
    func load(completionHandler:@escaping FundServiceCompletionHandler)
}
class FundServiceImp:FundService{
    let api = NetworkManager(url: Routes.fund.endpoint, method: .get)
    
    
    func load(completionHandler: @escaping FundServiceCompletionHandler) {
        api.response { (resultHelper) in
            switch resultHelper{
            case .success(let statusCode,let data):
                print("Status code:\(statusCode)")
                dump(data)
                let decoder = JSONDecoder()
                guard let funds = try? decoder.decode(Funds.self, from: data)else{
                    completionHandler(ResultHelper<Funds>.error(ErrorService.invalidJSON))
                    
                    return
                    
                }
                dump(funds)
                completionHandler(ResultHelper<Funds>.success(statusCode,funds))

      
                
            case .error(let error):
                print(error)
                completionHandler(ResultHelper<Funds>.error(ErrorService.custon(error: "Bad Request")))

             
                
            }
        }
    }
}



