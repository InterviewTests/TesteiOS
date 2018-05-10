//
//  FormService.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 08/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import Foundation
enum ErrorService:Error {
    case custon(error:String)
    case invalidJSON
}

protocol FormService {
    typealias FormServiceCompletionHandler = (ResultHelper<Cells>) -> Void
    func load(completionHandler:@escaping FormServiceCompletionHandler)
}
class FormServiceImp:FormService{
    let api = NetworkManager(url: Routes.cells.endpoint, method: .get)

    
    func load(completionHandler: @escaping FormServiceCompletionHandler) {
        api.response { (resultHelper) in
            switch resultHelper{
            case .success(let statusCode,let data):
                print("Status code:\(statusCode)")
                dump(data)
                let decoder = JSONDecoder()
                guard let form = try? decoder.decode(Cells.self, from: data)else{
                    completionHandler(ResultHelper<Cells>.error(ErrorService.invalidJSON))

                    return

                }
                dump(form)
           
                completionHandler(ResultHelper<Cells>.success(statusCode,form))

                
            case .error(let error):
                print(error)
                completionHandler(ResultHelper<Cells>.error(ErrorService.custon(error: "Bad Request")))


            }
        }
    }
    
    
}
