//
// FundsInteractor.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 07/07/19.
//

import Foundation

class FundsInteractor {

    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchFunds() {
//        networkManager.fetchFunds { result in
//            switch result {
//            case .success(let funds):
//                self.presenter.presentFundsData(funds)
//            case .failure(let error):
//                self.presenter.presentError(error.localizedDescription)
//            }
//        }
    }
}
