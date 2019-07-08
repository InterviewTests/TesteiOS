//
// FormInteractor.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 05/07/19.
//

import Foundation

enum ValidationError: Error {
    case invalidName
    case invalidPhone
    case invalidEmail
    
    var detail: String {
        switch self {
        case .invalidName:
            return "Check your name"
        case .invalidPhone:
            return "Check your phone"
        case .invalidEmail:
            return "Check your email"
        }
    }
}

class FormInteractor {
    
    private let networkManager: NetworkManager
    
    var presenter: FormPresenterProtocol

    init(presenter: FormPresenterProtocol,
         networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
        self.presenter = presenter
    }
    
    func fetchForm() {
        networkManager.fetchFormFields { (result) in
            switch result {
            case .success(let form):
                self.presenter.presentFormData(form)
            case .failure(let error):
                self.presenter.presentError(error.localizedDescription)
            }
        }
    }
}


// MARK: - Validators
extension FormInteractor {
    func isValid(name: String) -> Bool {
        return !name.isEmpty
    }
    
    func isValid(phone: String) -> Bool {
        let raw = phone.removingNonDigitCharacters
        return 10...11 ~= raw.count
    }
    
    func isValid(email: String) -> Bool {
        return email.validEmail
    }
    
    func isContactDataValid(_ contactData: ContactData) -> Result<Bool, ValidationError> {
        
        if !isValid(name: contactData.name) {
            return .failure(.invalidName)
        }
        
        if !isValid(phone: contactData.phone) {
            return .failure(.invalidPhone)
        }
        
        if let email = contactData.email {
            if !isValid(email: email) {
                return .failure(.invalidEmail)
            }
        }
        return .success(true)
    }
}
