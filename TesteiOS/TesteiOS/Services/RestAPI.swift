//
//  RestAPI.swift
//  TesteiOS
//
//  Created by Ricardo Suman on 01/05/2018.
//  Copyright © 2018 Ricardo Suman. All rights reserved.
//

import UIKit
import Foundation

protocol JSONCodable {}

enum Result<Value> {
    case success(Value)
    case failure(APIError)
}

enum APIError : Error {
    case requestFailed
    case encode
    case decode
    case reason(value: String)
}

class RestAPI: NSObject {
    
    static let serviceScheme: String = "https"
    static let serviceHost: String = "floating-mountain-50292.herokuapp.com"

    enum Service: String {
        case cells = "/cells.json"
        case fund = "/fund.json"
    }
    
    class func executeRequest(_ service: Service, jsonData: Data? = nil, httpHeader : [String : String]? = nil, httpMethod: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = serviceScheme
        urlComponents.host = serviceHost
        urlComponents.path = service.rawValue
        
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.setValue("*/*", forHTTPHeaderField: "accept")
        request.setValue("*", forHTTPHeaderField: "accept-encoding")
        request.setValue("*", forHTTPHeaderField: "accept-language")
        
        var requestHeader =  request.allHTTPHeaderFields ?? [:]
        if let headers = httpHeader {
            headers.forEach { (k,v) in requestHeader[k] = v }
        }
        request.allHTTPHeaderFields = requestHeader
        request.httpShouldHandleCookies = false
        
        if let encodableData = jsonData {
            request.httpBody = encodableData
        }
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request, completionHandler: completion)
        
        task.resume()
    }
}
