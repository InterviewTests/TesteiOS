//
//  SantanderAPI.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 28/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import Foundation

enum SantanderApiHost: String
{
    case test = "https://floating-mountain-50292.herokuapp.com/"
}

enum SantanderApiPath: RawRepresentable
{
    enum HTTPMethod: String
    {
        case get = "GET"//, post = "POST"
    }
    
    case investiment
    case contactForm
    
    typealias RawValue = (items: [URLQueryItem], path: String, method: HTTPMethod)
    
    init?(rawValue: RawValue)
    {
        return nil
    }
    
    var rawValue: RawValue
    {
//        var items = [URLQueryItem]()
        
        switch self
        {
            
        case .investiment:
            
            do
            {
                return ([], "fund.json", .get)
            }
            
        case .contactForm:
            
            do
            {
                return ([], "cells.json", .get)
            }
            
//            case .other(let id):
//
//            do
//            {
//                items.append(URLQueryItem(name: "any", value: String(id)))
//
//                return (items, "test.json", .post)
//            }
        }
    }
}

final class SantanderApiClient
{
    static let host: SantanderApiHost = .test
    
//    static private let headers = ["Content-Type": "application/json"]
    
    static private var dataTask: URLSessionDataTask?
    
    static func cancelRequest()
    {
        dataTask?.cancel()
    }
    
    static func request<T: Decodable>(operation: SantanderApiPath, completion: @escaping (Result<T,NSError>) -> ())
    {
        func debug(objects: [Any?])
        {
            print("\n##########################################")
            
            print("\n 🔴 BASE - " + SantanderApiClient.host.rawValue.uppercased())
            
            if let operation = objects.first(where: {$0 is SantanderApiPath.RawValue}) as? SantanderApiPath.RawValue
            {
                if let r = objects.first(where: {$0 is HTTPURLResponse}) as? HTTPURLResponse
                {
                    print("\t⚫️ " + String(format: "%@ - %@ | %@ ( %@ )", arguments: [operation.method.rawValue, operation.path, String(r.statusCode), HTTPURLResponse.localizedString(forStatusCode: r.statusCode).capitalized]))
                }
                else
                {
                    print("\t⚫️ " + String(format: "%@ - %@", arguments: [operation.method.rawValue, operation.path]))
                }
            }
            
            if let items = objects.first(where: {$0 is [URLQueryItem]}) as? [URLQueryItem]
            {
                print("\n 💙 JSON_SEND: \(items)")
            }
            
            if let data = objects.first(where: {$0 is Data}) as? Data, let receiveData = String(data: data, encoding: .utf8)
            {
                print("\n 💚 JSON_RECV: \(receiveData)")
            }
            
            if let e = objects.first(where: {$0 is NSError}) as? NSError
            {
                print("\n ⚠️ " + e.localizedDescription)
            }
            
            print("\n##########################################\n")
        }
        
        if var uCp = URLComponents(string: host.rawValue + operation.rawValue.path)
        {
            uCp.queryItems = operation.rawValue.items
            
            if let url = uCp.url
            {
                var uRq = URLRequest(url: url)
                
//                uRq.allHTTPHeaderFields = headers
                uRq.httpMethod = operation.rawValue.method.rawValue
                
//                if operation.rawValue.method == .post
//                {
//                    uRq.httpBody
//                }
                
                let config: URLSessionConfiguration = .default
                config.requestCachePolicy = .reloadIgnoringLocalCacheData
                
                dataTask = URLSession(configuration: config).dataTask(with: uRq) { (data, response, error) in
                    
                    debug(objects: [operation.rawValue, uCp.queryItems, data, response, error])
                    
                    do
                    {
                        if let e = error as NSError?
                        {
                            completion(.failure(e))
                        }
                        else
                        {
                            completion(.success(try JSONDecoder().decode(T.self, from: data ?? .init())))
                        }
                    }
                    catch let e
                    {
                        completion(.failure(e as NSError))
                    }
                    
                }
                
                dataTask?.resume()
            }
            else
            {
                completion(.failure(.init(domain: "CUSTOM_ERROR", code: 0, userInfo: [NSLocalizedDescriptionKey: "URL Mal Formada!"])))
            }
        }
        else
        {
            completion(.failure(.init(domain: "CUSTOM_ERROR", code: 0, userInfo: [NSLocalizedDescriptionKey: "URL Mal Formada!"])))
        }
    }
}
