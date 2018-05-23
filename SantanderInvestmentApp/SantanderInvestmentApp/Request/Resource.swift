//
//  Resource.swift
//  SantanderInvestmentApp
//
//  Created by Michel de Sousa Carvalho on 23/05/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> Result<T>
}

extension Resource where T: Codable {
    init(url: URL, parseJSON: @escaping (Result<T>) -> Result<T>) {
        self.url = url
        self.parse = { data in
            do {
                let result: T = try data.decode()
                return Result.success(result)
            } catch let e {
                return Result.error(e)
            }
        }
    }
}

extension Data {
    func decode<T: Decodable>(decoder: JSONDecoder = JSONDecoder()) throws -> T {
        return try decoder.decode(T.self, from: self)
    }
}


