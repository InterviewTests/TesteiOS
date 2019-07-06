//
// ProductionNetworkProvider.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 05/07/19.
//

import Foundation

fileprivate enum Path: String {
    case register = "https://floating-mountain-50292.herokuapp.com/cells.json"
}

class ProductionNetworkProvider: NetworkProviderProtocol {
    
    func fetchFormData(_ completion: @escaping (NetworkResponse) -> Void) {
        request(at: Path.register.rawValue) { (result) in
            completion(result)
        }
    }
    
    func fetchFundsData(_ completion: @escaping (NetworkResponse) -> Void) {
    }
}

extension ProductionNetworkProvider {
    private func request(at path: String, _ completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        guard let url = URL(string: path) else {
            completion(.failure(NetworkError.invalidPath))
            return
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(NetworkError.responseError(error.localizedDescription)))
                return
            }
            
            guard self.statusCode(fromResponse: response) == 200 else {
                completion(.failure(NetworkError.invalidStatusCode))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.missingResponseData))
                return
            }
            
            completion(.success(data))
        }
        task.resume()
    }
    
    private func statusCode(fromResponse response: URLResponse?) -> Int? {
        return (response as? HTTPURLResponse)?.statusCode
    }
}
