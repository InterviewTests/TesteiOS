//
//  Request.swift
//  SantanderInvestmentApp
//
//  Created by Michel de Sousa Carvalho on 23/05/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation

class Request {
    func load<T>(resource:Resource<T>, completion: @escaping (Result<T>) -> ()) {
        URLSession.shared.dataTask(with: resource.url as URL) { data, _, _ in
            guard let data = data else {
                completion(Result.error(nil))
                return
            }
            completion(resource.parse(data))
            }.resume()
    }
}
