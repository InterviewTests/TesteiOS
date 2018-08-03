//
//  RestAPI.swift
//  TesteiOS
//
//  Created by Dafle Cardoso on 02/08/2018.
//  Copyright © 2018 Dafle Cardoso. All rights reserved.
//

import Foundation

enum ApiError {
 
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}

class RestAPI {
    
    private static let basePath = "https://floating-mountain-50292.herokuapp.com/"
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type":"application/json"]
        config.timeoutIntervalForRequest = 30.0
        
        config.httpMaximumConnectionsPerHost = 5
        return config
    }()
    
    private static let session = URLSession(configuration: configuration)
    
    class func fetchGenericObject<T: Codable>(endPoint:String, onComplete: @escaping (T) -> (), onError: @escaping (ApiError) -> Void) {
        
        guard let url = URL(string: "\(basePath)\(endPoint)") else {
            onError(.url)
            return
        }
        
        session.dataTask(with: url) { (data, response, error) in
            
            if error == nil {
                
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                
                if response.statusCode == 200 {
                    
                    guard let data = data else { return }
                    
                    do {
                        let obj = try JSONDecoder().decode(T.self, from: data)
                        onComplete(obj)
                        
                    } catch {
                        print(error.localizedDescription)
                        onError(.invalidJSON)
                    }
                    
                } else {
                    onError(.responseStatusCode(code: response.statusCode))
                }
                
            } else {
                onError(.taskError(error: error!))
            }
            
        }.resume()
    }
}














