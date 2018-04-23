//
//  DiscoveryRouter.swift
//  iOS-Test
//
//  Created by BTG-Mobile on 22/03/18.
//  Copyright © 2018 Gabriel Vieira. All rights reserved.
//

import Foundation
import Alamofire


enum APIRouter : URLRequestConvertible {
    
    case formCells()
    case Fund()
    
    var path: String {
        
        switch self {
            
        case .formCells:
            return NetworkingConstants.formCells
            
        case .Fund:
            return NetworkingConstants.fund
        }
    }
    
    var parameters: [String: Any] {
        
        let paramDict : [String: Any] = [:]
        
//        paramDict["api_key"] = NetworkingConstants.api_key
         //there is nothing header to add, but is prepared for
        //****Example for paramenters in router*****
//        switch self {
//
//        case let .discoveryMovies(language, sort_by, include_adult, include_video, page):
//            paramDict["language"] = language
//            paramDict["sort_by"] = sort_by
//            paramDict["include_adult"] = include_adult
//            paramDict["include_video"] = include_video
//            paramDict["page"] = page
//
//        default:
//            break
//        }
        
        return paramDict
    }
    
    
    var method: HTTPMethod {
        switch self {
            
        case .formCells:
            return .get
            
        case .Fund:
            return .get
        }
    }
    
    var headers: HTTPHeaders {
        
        //there is nothing header to add, but is prepared for
        let headers : [String:String] = [:]
        return headers
    }
    
    
    func asURLRequest() throws -> URLRequest {
        
//        let url = try NetworkingConstants.baseURL.asURL()
        var urlRequest = URLRequest(url: URL.init(string: path)!)
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        
        return try URLEncoding.methodDependent.encode(urlRequest, with: parameters)
        
    }
}
