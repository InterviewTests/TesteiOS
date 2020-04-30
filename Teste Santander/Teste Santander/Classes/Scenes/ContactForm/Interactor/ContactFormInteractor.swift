//
//  ContactFormInteractor.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 28/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation

protocol ContactFormInteractorProtocol {
    /// Requests the Contact List
    func fetchContactList()
}
class ContactFormInteractor: ContactFormInteractorProtocol {
    // MARK: - Interface Properties
    var viewController: ContactFormViewControllerProtocol?
    var presenter: ContactFormPresenterProtocol?
    
    var contactFormWorker: ContactFormWorkerProtocol?
    
    // MARK: - Initialization
    init(viewController: ContactFormViewControllerProtocol, presenter: ContactFormPresenterProtocol) {
        self.viewController = viewController
        self.presenter = presenter
        contactFormWorker = ContactFormWorker()
    }
    
    // MARK: - ContactFormInteractorProtocol
    func fetchContactList() {
        viewController?.startLoading()
        
        contactFormWorker?.fetchContactForm(completion: { (responseData) in
            self.viewController?.stopLoading()
            
            do {
                let contactModel = try JSONDecoder().decode(ContactModel.self, from: responseData ?? Data())
                
                self.presenter?.handleFormCells(cells: contactModel)
            } catch {
                print(error)
            }
        }) { (error) in
            self.viewController?.stopLoading()
            
            self.presenter?.handleError(error: error)
        }
    }
}
