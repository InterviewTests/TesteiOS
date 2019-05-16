//
//  RouterAPI.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Alamofire

enum RouterAPI : URLRequestConvertible {
    
    static let url:String = "https://floating-mountain-50292.herokuapp.com/"
    
    case cellForm
    case detail
    
    var header : HTTPHeaders {
        return ["Content-Type":"application/x-www-form-urlencoded"]
    }
    
    var method : HTTPMethod {
        switch self {
        case .cellForm: return .get
        case .detail: return .get
        }
    }
    
    var path : String {
        switch self {
            
        //USERS
        case .cellForm:
            return "cells.json"
        case .detail:
            return "fund.json"
            
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try RouterAPI.url.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = header        
        
        print("URL_REQUEST => ", urlRequest)
        
        return urlRequest
    }
    
}

