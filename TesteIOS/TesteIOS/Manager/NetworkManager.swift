//
//  NetworkManager.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit
import Alamofire

typealias JSONDict = [String: Any]

struct NetworkManager {
    typealias Parameters = [String: Any]
    typealias DataParameters = [String: Data]
    typealias Headers = [String:String]
    typealias Method = Alamofire.HTTPMethod
    typealias CompletionHandler = (DataResponse<Any>) -> Void
    
    static let baseURL: String = Settings.shared.apiURL
    
    static let defaultHeader: Headers = [:]
    
    /**
     Cria request com parâmetros JSON
     */
    static func requestJson(method: Method, url: String, parameters: Parameters? = nil, headers: Headers? = nil, completion: @escaping CompletionHandler) {
        Alamofire.request(url
            , method: method
            , parameters: parameters
            , encoding: JSONEncoding.default
            , headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON(completionHandler: completion)
    }
    
    /**
     Cria request com parâmetros HTTP
     */
    static func requestURL(method: Method, url: String, parameters: Parameters? = nil, headers: Headers? = nil, completion: @escaping CompletionHandler) {
        Alamofire.request(url
            , method: method
            , parameters: parameters
            , encoding: URLEncoding.httpBody
            , headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON(completionHandler: completion)
    }
}
