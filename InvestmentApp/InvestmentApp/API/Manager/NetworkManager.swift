//
//  NetworkManager.swift
//  NetworkLayer
//
//  Created by Matheus Weber on 30/03/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import Foundation

enum NetworkResponse:String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
    case noInternetConnection = "No internet connection detected."
}

enum Result<NetworkResponse>{
    case success
    case failure(NetworkResponse)
}

class NetworkManager {
    fileprivate let router = Router<InvestmentAPI>()
    
    func request<T: Codable>(request: InvestmentAPI,
                             success: @escaping (_ result: T) -> (),
                             failure: @escaping (_ error: NetworkResponse) -> ()) {
        
        router.request(request) { (data, response, error) in
            if error == nil {
                if let response = response as? HTTPURLResponse {
                    let result = self.handleNetworkResponse(response)
                    
                    switch result {
                    case .success:
                        guard let responseData = data else {
                            failure(NetworkResponse.noData)
                            return
                        }
                        do {
                            let apiResponse = try JSONDecoder().decode(T.self, from: responseData)
                            success(apiResponse)
                        } catch {
                            failure(NetworkResponse.unableToDecode)
                        }
                    case .failure(let error):
                        failure(error)
                    }
                } else {
                    failure(NetworkResponse.failed)
                }
            } else {
                failure(NetworkResponse.noInternetConnection)
            }
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<NetworkResponse>{
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError)
        case 501...599: return .failure(NetworkResponse.badRequest)
        case 600: return .failure(NetworkResponse.outdated)
        default: return .failure(NetworkResponse.failed)
        }
    }
}

