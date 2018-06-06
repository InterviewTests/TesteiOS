//
//  APIClient.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 28/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//


import Foundation
import Alamofire


enum APIClientError: Error {
    case CouldNotDecodeJSON
    case BadStatus(status: Int)
    case Other(NSError)
}


extension APIClientError: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .CouldNotDecodeJSON:
            return "Could not decode JSON"
        case let .BadStatus(status):
            return "Bad status \(status)"
        case let .Other(error):
            return "\(error)"
        }
    }
}

class APIClient:Networking {
    
    private(set) var message:String = ""
    private(set) var token:String  = ""
    
    
    func request(request:URLRequest, _ dataResponse: @escaping (Any?) -> ()) {
        
            Alamofire.request(request).responseData { response in
                if let json = response.result.value {
                    let result = json
                    dataResponse(result)
                }
            }
            
            
        }
    
    
}
