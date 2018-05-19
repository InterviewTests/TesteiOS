//
//  ContactFormRouter.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import UIKit

class ContactFormRouter: BaseRouter {
    
    class func instantiate() -> ContactFormViewController {
        let vc = ContactFormViewController(nibName: "ContactFormView", bundle: .main)
        vc.title = "Contato"
        
        let presenter = ContactFormPresenter()
        let interactor = ContactFormInteractor()
        
        vc.presenter = presenter
        presenter.delegate = vc
        
        presenter.interactor = interactor
        interactor.delegate = presenter
        
        return vc
    }
}
