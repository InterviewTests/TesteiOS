//
//  ResponseHelper.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 08/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import Foundation
class ResponseHelper{
    private var request:URLRequest
    
    init(request:URLRequest) {
        self.request = request
    }
    
    func getData(completion:@escaping (ResultHelper<Data>) -> Void){
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error as NSError? {
                let result = ResultHelper<Data>.error(error)
                DispatchQueue.main.async {
                    completion(result)
                }
                return
            }
            
            let data = data ?? Data()
            let response = response as! HTTPURLResponse
            let result = ResultHelper<Data>.success(response.statusCode, data)
            DispatchQueue.main.async {
                completion(result)
            }
        }
        
        task.resume()
    }
}
