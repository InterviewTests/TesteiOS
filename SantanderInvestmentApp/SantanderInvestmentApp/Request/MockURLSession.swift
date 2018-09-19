//
//  MockURLSession.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 17/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation

class MockURLSession: URLSessionProtocol {
    
    var nameJSON: String?
    var statusCode: Int
    
    init(with nameJSON: String? = nil, statusCode: Int = 200) {
        self.nameJSON = nameJSON
        self.statusCode = statusCode
    }
    
    func dataTask(with request: URLRequest, completion: @escaping URLSessionProtocol.DataTaskResult)
        -> URLSessionDataTaskProtocol{
            
            guard let url = request.url else {
                fatalError("Must provide URL")
            }
            
            guard let nameJson = nameJSON else {
                fatalError("Must provide name JSON")
            }
            
            let response = HTTPURLResponse(url: url, statusCode: self.statusCode, httpVersion: "HTTP/2.0", headerFields: nil)
            let data = self.mock(jsonFile: nameJson)
            
            completion(data, response, nil)
            return MockURLSessionDataTask()
    }
    
    func mock(jsonFile: String) -> Data? {
        if let path = Bundle.main.path(forResource: jsonFile, ofType: "json") {
            let url = URL(fileURLWithPath: path)
            guard let data = try? Data(contentsOf: url) else {
                fatalError("Error parse json to Data")
            }
            return data
        } else {
            return nil
        }
    }
}

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private (set) var resumeWasCalled = false
    func resume() {
        resumeWasCalled = true
    }
}
