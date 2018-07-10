//
//  ShowFundsWorker.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright (c) 2018 Felipe Borges. All rights reserved.
//
//

import UIKit

class ShowFundsWorker {
    
    typealias Response = ShowFunds.Funds.Response
    typealias FundsInfo = ShowFunds.FundsInfo
    
    func request(url: URL, completion: @escaping (ShowFunds.Funds.Response)->()) {
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completion(Response.error(error: error))
                return
            }
            
            do {
                guard let resp = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any] else {
                    completion(Response.error(error: ParsingError.BadJSONError))
                    return
                }
            
                let fundsInfo = try FundsInfo(dict: resp)
                
                completion(Response.success(data: fundsInfo))
            } catch let error {
                completion(Response.error(error: error))
            }
        }
        
        task.resume()
    }
 
}
