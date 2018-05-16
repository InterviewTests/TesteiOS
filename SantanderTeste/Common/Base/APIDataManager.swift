//
//  APIDataManager.swift
//  Arch
//
//  Created by Rafael Macito on 26/01/2018.
//  Copyright © 2018 Madeinweb. All rights reserved.
//

import Foundation

enum Endpoint: String {

    case fund  = "fund.json"
    case cells = "cells.json"
}

class APIDataManager {
    
    private var baseURL: String {
        return "https://floating-mountain-50292.herokuapp.com/"
    }
    
    func request<D: Decodable>(endpoint: Endpoint,
                               success: @escaping (_ response: D) -> Void,
                               failure: @escaping (_ error: String) -> Void) {
        guard let url = URL(string: baseURL + endpoint.rawValue) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    failure(error.localizedDescription)
    
                    return
                }
    
                guard let data = data, !data.isEmpty else {
                    failure("Empty Data")
    
                    return
                }
    
                do {
                    success(try JSONDecoder().decode(D.self, from: data))
                } catch {
                    failure(error.localizedDescription)
                }
            }
        }
        
        task.resume()
    }
}
