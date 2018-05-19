//
//  ContactFormPresenter.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import Foundation

protocol ContactFormPresenterDelegate: BasePresenterDelegate {
    func loadUI(_ contactForm: ContactForm)
    func validationError(in cell: ContactFormItem)
    func successSent()
}

class ContactFormPresenter: BasePresenter {
    
    weak var delegate: ContactFormPresenterDelegate?
    var interactor: ContactFormInteractor?
    
    var contactForm: ContactForm?
    
    func loadUIIfNeeded() {
        guard let contactForm = contactForm else {
            interactor?.loadContactForm()
            
            return
        }
        
        delegate?.loadUI(contactForm)
    }
    
    func validate(_ cells: [ContactFormItem]) {
        delegate?.loading(true)
        
        interactor?.validate(cells)
    }
}

extension ContactFormPresenter: ContactFormInteractorDelegate {
    // MARK: ContactFormInteractorDelegate
    
    func error(_ title: String?, _ error: String) {
        delegate?.loading(false)
        
        delegate?.error(title, error)
    }
    
    func contactFormLoaded(_ contactForm: ContactForm) {
        delegate?.loading(false)
        
        self.contactForm = contactForm
        
        delegate?.loadUI(contactForm)
    }
    
    func validationError(_ cell: ContactFormItem, error: String) {
        delegate?.loading(false)
        
        delegate?.error("Erro de validação", error)
        delegate?.validationError(in: cell)
    }
    
    func validationSuccess(_ cells: [ContactFormItem]) {
        delegate?.loading(false)
        
        delegate?.successSent()
    }
}
