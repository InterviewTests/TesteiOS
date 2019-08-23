//
//  MoyaProvider.swift
//  Santander
//
//  Created by Orlando Amorim on 17/08/19.
//

import Moya

extension MoyaProvider {
    @discardableResult
    func request<T: Decodable>(_ target: Target, decodeType: T.Type, result: @escaping (Result<T, Error>) -> Void) -> Cancellable? {
        return request(target) { requestResult in
            switch requestResult {
            case .success(let response):
                let decoder = JSONDecoder()
                do {
                    let decodableObject = try decoder.decode(T.self, from: response.data)
                    result(.success(decodableObject))
                } catch let error {
                    result(.failure(error))
                }
            case .failure(let error):
                result(.failure(error))
            }
        }
    }
}
