//
// FormInteractor.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 05/07/19.
//

import Foundation

class FormInteractor {
    
    private let networkManager: NetworkManager
    
    var presenter: FormPresenterProtocol

    init(presenter: FormPresenterProtocol) {
        networkManager = NetworkManager()
        self.presenter = presenter
    }
    
    func fetchForm() {
        networkManager.fetchFormFields { (result) in
            switch result {
            case .success(let form):
                self.presenter.presentForm(form)
            case .failure(let error):
                self.presenter.presentError(error.localizedDescription)
            }
        }
    }
}
