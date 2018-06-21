//
//  ContactConfigurator.swift
//  Teste-STD
//
//  Created by Phelipe Campos on 22/05/18.
//  Copyright © 2018 Phelipe Campos. All rights reserved.
//

import UIKit


class ContactConfigurator {
    
    static let sharedInstance = ContactConfigurator()
    private init(){}
    
    func configure(viewController: ContactViewController){
        let router = ContactRouter()
        router.viewController = viewController
        let presenter = ContactPresenter()
        let interactor = ContactInteractor()
        router.viewController = viewController
        viewController.router = router
        
        
    }
}
