//
//  Resource.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 17/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation

struct Resource<T> {
    let url: URL
    let method: HttpMethod<Any>
    var parametersHeader: [String: String]
    let parse: (Data) -> Result<T>
    let encodeType: Encoding
}

extension Resource where T: Codable {
    init(url: URL, method: HttpMethod<Any> = .get(data: nil),
         parametersHeader: [String: String] = Header.headerDefault(header: RequestHeaderMethod.urlEncoded.rawValue),
         encodeType: Encoding = URLTypeEncoding(),
         parseJSON: @escaping (Result<T>) -> Result<T>) {
        self.url = url
        self.parametersHeader = parametersHeader
        self.encodeType = encodeType
        switch method {
        case .get(data: _):
            self.method = method.map(f: { (params) -> String in
                guard let params = params as? [String: Any] else{
                    return ""
                }
                return params.queryFormat()
            })
        case .post(data: _):
            self.method = method.map{ json in
                var data = Data.init()
                
                if let jsonDict = json as? [String: Any] {
                    data = encodeType.encode(params: jsonDict).orNoData
                }
                
                if let jsonArray = json as? [Any] {
                    data = encodeType.encode(params: jsonArray).orNoData
                }
                
                if let object = json as? Data {
                    
                    data = object
                }
                
                return data
            }
        }
        
        
        self.parse = { data in
            do {
                let result: T = try data.decode()
                return Result.success(result)
            } catch let e {
                return Result.failureNetwork(NetworkErrorResponse.unableToDecode)
            }
        }
    }
}

extension Data {
    func decode<T: Decodable>(decoder: JSONDecoder = JSONDecoder()) throws -> T {
        return try decoder.decode(T.self, from: self)
    }
}
