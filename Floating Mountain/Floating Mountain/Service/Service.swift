//
//  Service.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 9/14/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

import Foundation

class Service {
    
    let url: URL
    let decoder: JSONDecoder
    
    var session: URLSession {
        return .shared
    }
    
    static var floatingMountain = Service(url: URL(string: "https://floating-mountain-50292.herokuapp.com")!)
    
    init(url: URL, decoder: JSONDecoder = JSONDecoder()) {
        self.url = url
        self.decoder = decoder
    }
    
    func url(for resource: Resource) -> URL {
        return url.appendingPathComponent(resource.node)
    }
    
    func request<T>(resource: Resource, completion: @escaping (T?, Error?) -> Void) where T : Codable {
        let url = self.url(for: resource)
        let task = session.dataTask(with: url) { [weak self] (data, response, error) in
            self?.session.finishTasksAndInvalidate()
            var resourceObject: T? = nil
            var responseError: Error? = nil
            defer {
                DispatchQueue.main.async {
                    completion(resourceObject, responseError)
                }
            }
            guard let data = data else {
                responseError = error
                return
            }
            do {
                resourceObject = try self?.decoder.decode(T.self, from: data)
            } catch {
                responseError = error
            }
        }
        task.resume()
    }
    
}
