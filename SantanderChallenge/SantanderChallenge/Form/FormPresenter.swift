//
// FormPresenter.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 05/07/19.
//

import Foundation

protocol FormPresenterProtocol {
    func presentFormData(_ formData: Data)
    func presentError(_ error: String)
}

class FormPresenter: FormPresenterProtocol {
    weak var view: FormPresentableProtocol?
    
    init(view: FormPresentableProtocol) {
        self.view = view
    }
    
    func presentFormData(_ formData: Data) {
        
        do {
            let response = try JSONDecoder().decode(FormCellsResponse.self, from: formData)
            guard let cells = response.cells else {
                self.view?.displayError("Invalid Response")
                return
            }
            
            DispatchQueue.main.async {
                self.view?.displayForm(cells)
            }
        } catch {
            self.view?.displayError(error.localizedDescription)
        }
    }
    
    func presentError(_ error: String) {
        DispatchQueue.main.async {
            self.view?.displayError(error)
        }
    }
}
