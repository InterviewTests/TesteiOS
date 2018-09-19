//
//  FormWorker.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 18/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation

class FormWorker {
    
    func getForm(session: URLSessionProtocol = URLSession.shared, completion: @escaping (_ cells: [CellModel]) -> (),
                 failure:@escaping(_ error: NetworkErrorResponse)-> ()) {
        guard let url = URL(string: Constants.Request.cells) else {
            fatalError("Must provide a URL")
        }
        
        let resource = Resource<CellsModel>.init(url: url, parseJSON: { result in
            return result
        })
        
        Request.load(session: session, resource: resource, completion: { result in
            switch result {
            case let .success(cell):
                completion(cell.cells)
            case let .failureNetwork(error):
                failure(error)
            }
            
        })   
    }
    

}

