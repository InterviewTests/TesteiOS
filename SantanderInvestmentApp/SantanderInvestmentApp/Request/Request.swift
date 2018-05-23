//
//  Request.swift
//  SantanderInvestmentApp
//
//  Created by Michel de Sousa Carvalho on 23/05/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation

final class Request {
   static func load<T>(resource:Resource<T>, completion: @escaping (Result<T>) -> ()) {
        let request = URLRequest(resource: resource)
        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else {
                completion(Result.error(nil))
                return
            }
            completion(resource.parse(data))
            }.resume()
    }
}


extension URLRequest {
    init<T>(resource: Resource<T>) {
        self.init(url: resource.url)
        httpMethod = resource.method.method
        self.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        if case let .post(data) = resource.method {
            httpBody = data
        }
    }
}
