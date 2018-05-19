//
//  ContactFormInteractor.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import Foundation

protocol ContactFormInteractorDelegate: BaseInteractorDelegate {
    func contactFormLoaded(_ contactForm: ContactForm)
    func validationError(_ cell: ContactFormItem, error: String)
    func validationSuccess(_ cells: [ContactFormItem])
}

class ContactFormInteractor: BaseInteractor {
    
    weak var delegate: ContactFormInteractorDelegate?
    
    func loadContactForm() {
        APIDataManager().request(endpoint: .cells, success: { [weak self] (response: ContactForm) in
            self?.delegate?.contactFormLoaded(response)
        }, failure: { [weak self] (error) in
            self?.delegate?.error(nil, error)
        })
    }
    
    func validate(_ cells: [ContactFormItem]) {
        for cell in cells {
            guard cell.required, !cell.hidden else { continue}
            
            if cell.type == .field {
                if cell.textValue.isEmpty {
                    delegate?.validationError(cell, error: "Campo vazio")
                    return
                } else if cell.typefield == .email, !cell.textValue.isValidEmail() {
                    delegate?.validationError(cell, error: "Email invalido")
                    return
                }
            }
        }
        
        delegate?.validationSuccess(cells)
    }
}
