//
// ProductionNetworkProvider.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 05/07/19.
//

import Foundation

class ProductionNetworkProvider: NetworkProviderProtocol {
    func fetchFormData(_ completion: @escaping (Bool) -> Void) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        let task = session.dataTask(with: URL(string: "https://floating-mountain-50292.herokuapp.com/cells.json")!) { (data, response, error) in
            completion(true)
            print("Data: ", data ?? "")
            print("Response: ", response ?? "")
            print("Error: ", error ?? "")
        }
        
        task.resume()
    }
    
    func fetchFundsFields(_ completion: @escaping (Bool) -> Void) {
        
    }
    

    
    
}
