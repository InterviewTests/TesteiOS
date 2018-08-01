//
//  ContactInteractor.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//


import UIKit

protocol ContactBusinessLogic {
    func fetch(request: Contact.Fetch.Request)
}


class ContactInteractor: ContactBusinessLogic {
    var presenter: ContactPresentationLogic?
    var worker: ContactWorker?
    
    func fetch(request: Contact.Fetch.Request) {
        worker = ContactWorker()
        worker?.fetchForm(url: request.url!, success: { (response) in
            let response = Contact.Fetch.Response(cells: response.cells, error: response.error, message: response.message)
            self.presenter?.display(response: response)
        }, failure: { (response) in
            let response = Contact.Fetch.Response(cells: response.cells, error: response.error, message: response.message)
            self.presenter?.display(response: response)
        })
    }
}

