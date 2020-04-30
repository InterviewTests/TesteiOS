//
//  ContactFormRouter.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 28/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation

class ContactFormRouter {
    public static func rootViewController(delegate: ContactFormTransitionProtocol) -> ContactFormViewController {
        let contactForm = ContactFormViewController.loadFromNib()
        let contactFormPresenter = ContactFormPresenter(viewController: contactForm)
        let contactFormInteractor = ContactFormInteractor(viewController: contactForm, presenter: contactFormPresenter)
        
        contactForm.interactor = contactFormInteractor
        contactForm.delegate = delegate
        
        return contactForm
    }
    
    public static func presentSuccessViewcontroller(contactFormViewController: ContactFormViewController) {
        let successContactViewController = ContactFormResultViewController.loadFromNib()
                
        contactFormViewController.present(successContactViewController, animated: true, completion: nil)
    }
}
