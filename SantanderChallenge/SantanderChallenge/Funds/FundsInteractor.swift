//
// FundsInteractor.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 07/07/19.
//

import Foundation

class FundsInteractor {

    private let networkManager: NetworkManager
    private let presenter: FundsPresenterProtocol
    
    init(presenter: FundsPresenterProtocol,
         networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
        self.presenter = presenter
    }
    
    func fetchFunds() {
        networkManager.fetchFunds { result in
            switch result {
            case .success(let funds):
                self.presenter.presentFundsData(funds)
            case .failure(let error):
                self.presenter.presentError(error.localizedDescription)
            }
        }
    }
}
