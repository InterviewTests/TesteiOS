//
// FormPresenter.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 05/07/19.
//

import Foundation

protocol FormPresenterProtocol {
    func presentForm(_ form: String)
    func presentError(_ error: String)
}

class FormPresenter: FormPresenterProtocol {
    weak var view: FormPresentableProtocol?
    
    init(view: FormPresentableProtocol) {
        self.view = view
    }
    
    func presentForm(_ form: String) {
        DispatchQueue.main.async {
            self.view?.displayForm(form)
        }
    }
    
    func presentError(_ error: String) {
        DispatchQueue.main.async {
            self.view?.displayError(error)
        }
    }
}
