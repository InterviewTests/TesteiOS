//
// NetworkManager.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 05/07/19.
//

import Foundation

class NetworkManager {
    
    private var provider: NetworkProviderProtocol!
    
    init() {
        defineProviderBasedOnEnvironment()
    }
    
    init(provider: NetworkProviderProtocol) {
        self.provider = provider
    }
    
    private func defineProviderBasedOnEnvironment() {
        guard let environment = EnvironmentManager.shared.environmentId else {
            fatalError("Environment not found")
        }
        
        switch environment {
        case .development:
            provider = DevelopmentNetworkProvider()
        case .production:
            provider = ProductionNetworkProvider()
        }
    }
}

extension NetworkManager {
    
    func fetchFormFields(_ completion: @escaping (NetworkResponse) -> Void) {
        provider.fetchFormData(completion)
    }
    
    func fetchFunds(_ completion: @escaping (NetworkResponse) -> Void) {
        provider.fetchFundsData(completion)
    }
}
