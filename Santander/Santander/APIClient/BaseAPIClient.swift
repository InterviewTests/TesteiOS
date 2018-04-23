//
//  APIClient.swift
//  iOS-Test
//
//  Created by Gabriel Vieira on 22/04/18.
//  Copyright © 2018 Gabriel Vieira. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

typealias APIClientResponse<T:Mappable> = (T?, APIClientError?)
typealias APIClientResponseArray<T:Mappable> = ([T], APIClientError?)

enum APIClientError: Error {
    case CouldNotDecodeJSON
    case BadStatus(status: Int)
    case Other(NSError)
}

class BaseAPIClient {
 
    private static var sessionManager: Alamofire.SessionManager  = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 4 // seconds
        configuration.timeoutIntervalForResource = 4
        return Alamofire.SessionManager(configuration: configuration)
    }()

    static func request<T:Mappable>(url: URLRequestConvertible, ofType _: T.Type,_ completionHandler: @escaping (APIClientResponse<T>) -> Void)  {
        
        self.sessionManager.request(url).responseJSON(completionHandler: { response in
            
            switch response.result {
                
            case .failure(let error):
                let error_cast = APIClientError.Other(error as NSError)
                completionHandler( (nil,error_cast) )
                return
                    
            case .success(let data):
                
                guard let json = data as? [String : AnyObject] else {
                    completionHandler((nil,.CouldNotDecodeJSON))
                    return
                }

                guard let obj = Mapper<T>().map(JSON: json) else {
                    completionHandler((nil,.CouldNotDecodeJSON))
                    return
                }
                
                completionHandler((obj,nil))
                return
            }
        })
    }
}
