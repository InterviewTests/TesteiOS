//
//  ContactPresenter.swift
//  Profile
//
//  Created by Renee Alves on 28/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation

protocol DisplayContactScreenPresentationLogic
{
    func presentContactScreen(response: [ShowContact.GetCell.ViewModel.Cell])
}

class ContactPresenter: DisplayContactScreenPresentationLogic {
    
    weak var view: ContactViewController?
    
    func presentContactScreen(response: [ShowContact.GetCell.ViewModel.Cell]) {
        
        DispatchQueue.main.async {
            self.view?.displayContactWith(rules: response)
        }
        
    }
}
