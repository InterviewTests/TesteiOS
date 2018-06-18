//
//  ContactPresenter.swift
//  TesteIOS
//
//  Created by Sidney Silva on 11/06/2018.
//  Copyright (c) 2018 Sakura Soft. All rights reserved.
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
