//
//  Service.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 22/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
    case get = "GET"
}

struct Service<T: Decodable> {
    func get(url: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else {return print("Does not parse String to URL")}
        
        let session = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return print("Does not load data") }
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {completion(.success(result))}
            } catch {
                print("Error in decode class: \(T.className) with error: \(error)")
                DispatchQueue.main.async {completion(.failure(error))}
            }
        }
        DispatchQueue.global(qos: .background).async {session.resume()}
    }
    
    
    func post(params: [String: String], url: String, completion: @escaping (Error?) -> Void) {
        guard let url = URL(string: url) else {return print("Does not parse String to URL")}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.post.rawValue
        
        do {
            let data = try JSONSerialization.data(withJSONObject: params, options: .init())
            
            urlRequest.httpBody = data
            urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
            
            let session = URLSession.shared.dataTask(with: urlRequest) { (_ , _, error) in
                if let err = error {return completion(err)}
                completion(nil)
            }
            
            DispatchQueue.global(qos: .background).async {session.resume()}
        } catch {
            completion(error)
        }
    }
}
