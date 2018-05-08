//
//  RestManager.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 08/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import Foundation
enum HttpMethod : String {
    case get    = "GET"
    case post   = "POST"
    case delete = "DELETE"
    case put    = "PUT"
    case patch  = "PATCH"
}


class RestManager {
    
    fileprivate init() {}
    
    static  func get(_ url:String) -> NetworkManager {
        let request = NetworkManager(url: url, method:HttpMethod.get)
        return request
    }
    
    static  func post(_ url:String) -> NetworkManager {
        let request = NetworkManager(url: url, method:HttpMethod.post)
        return request
    }
    
    static  func put(_ url:String) -> NetworkManager {
        let request = NetworkManager(url: url, method:HttpMethod.put)
        return request
    }
    
    static  func delete(_ url:String) -> NetworkManager {
        let request = NetworkManager(url: url, method:HttpMethod.delete)
        return request
    }
    
    static  func patch(_ url:String) -> NetworkManager {
        let request = NetworkManager(url: url, method:HttpMethod.patch)
        return request
    }
}
