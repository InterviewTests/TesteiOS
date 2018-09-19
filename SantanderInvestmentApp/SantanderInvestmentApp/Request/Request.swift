//
//  Request.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 17/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation

final class Request {
   static func load<T>(session: URLSessionProtocol = URLSession.shared, resource:Resource<T>,
                       completion: @escaping (Result<T>) -> ()) {
        let request = URLRequest(resource: resource)
        session.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                    case 200...299:
                        guard let data = data else {
                            completion(Result.failureNetwork(NetworkErrorResponse.noData))
                            return
                        }
                        completion(resource.parse(data))
                    case 401...500:
                        completion(Result.failureNetwork(NetworkErrorResponse.authenticationError))
                    case 501...599:
                        completion(Result.failureNetwork(NetworkErrorResponse.badRequest))
                    case 600:
                        completion(Result.failureNetwork(NetworkErrorResponse.outdated))
                    default:
                        completion(Result.failureNetwork(NetworkErrorResponse.failed))
                }
            }
            }.resume()
    }
}


extension URLRequest {
    init<T>(resource: Resource<T>) {
        self.init(url: resource.url)
        httpMethod = resource.method.method
        self.allHTTPHeaderFields = resource.parametersHeader
        if case let .get(params) = resource.method {
            if let params = params as? String, var urlComponents =
                URLComponents(url: resource.url, resolvingAgainstBaseURL: false) {
                urlComponents.percentEncodedQuery = params
                self.url = urlComponents.url
            }
        }
        if case let .post(data) = resource.method {
            if let data = data as? Data {
                httpBody = data
            }
        }
    }
}
