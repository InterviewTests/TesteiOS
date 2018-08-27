//
//  ContactRouter.swift
//  Teste-STD
//
//  Created by Phelipe Campos on 22/05/18.
//  Copyright © 2018 Phelipe Campos. All rights reserved.
//

import UIKit


protocol ContactRouterInput {
    func showSucess()
}
class ContactRouter: ContactRouterInput {
    weak var viewController: ContactViewController!
    func showSucess() {
        viewController.performSegue(withIdentifier: "showSucess", sender: nil)
    }
    
    
}
