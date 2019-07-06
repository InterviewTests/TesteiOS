//
// DevelopmentNetworkProvider.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 05/07/19.
//

import Foundation

class DevelopmentNetworkProvider: NetworkProviderProtocol {
    func fetchFormData(_ completion: @escaping (NetworkResponse) -> Void) {
        guard let data = Bundle.loadJSONFromBundle(resourceName: "cells") else {
            completion(.failure(.missingResponseData))
            return
        }
        
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1) {
            completion(.success(data))
        }
    }
    
    func fetchFundsData(_ completion: @escaping (NetworkResponse) -> Void) {
        guard let data = Bundle.loadJSONFromBundle(resourceName: "funds") else {
            completion(.failure(.missingResponseData))
            return
        }
        
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1) {
            completion(.success(data))
        }
    }
}
