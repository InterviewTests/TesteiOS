//
//  ContactPresenter.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//


import UIKit

protocol ContactPresentationLogic { 
  func display(response: Contact.Fetch.Response)
}

class ContactPresenter: ContactPresentationLogic {
  weak var viewController: ContactDisplayLogic?
  
  func display(response: Contact.Fetch.Response) {
    let viewModel = Contact.Fetch.ViewModel(cells: response.cells, error: response.error)
    viewController?.display(viewModel: viewModel)
  }
}
