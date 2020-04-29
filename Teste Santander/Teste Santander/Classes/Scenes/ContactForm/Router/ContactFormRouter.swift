//
//  ContactFormRouter.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 28/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation

class ContactFormRouter {
    public static func rootViewController() -> ContactFormViewController {
        let contactForm = ContactFormViewController.loadFromNib()
        let contactFormPresenter = ContactFormPresenter(viewController: contactForm)
        let contactFormInteractor = ContactFormInteractor(viewController: contactForm, presenter: contactFormPresenter)
        
        contactForm.interactor = contactFormInteractor
        
        return contactForm
    }
}
