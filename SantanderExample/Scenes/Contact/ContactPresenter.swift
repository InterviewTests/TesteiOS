//
//  ContactPresenter.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 13/05/2018.
//  Copyright (c) 2018 Luan Henrique Damasceno Costa. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ContactPresentationLogic {
  func presentFetchedContact(form: Contact.Form.Response)
  func presentFetchedError(error: Contact.Form.ErrorResponse)
}

class ContactPresenter: ContactPresentationLogic {
  weak var viewController: ContactDisplayLogic?

  func presentFetchedContact(form: Contact.Form.Response) {
    guard let formList = form.form.cells else {
      viewController?.displayError(title: "An error has occur.", message: "Try again later.")
      return
    }
    
    let list = formList.compactMap { (contact) -> Contact.ContactFormCell.ViewModel? in
      guard let type = contact.type,
        let message = contact.message else {
        return nil
      }
  
      return Contact.ContactFormCell.ViewModel(type: type, validationType: contact.typefield ?? .text, text: message, topSpacing: contact.topSpacing ?? 0.0)
    }
    
    let viewModel = Contact.Form.ViewModel(contactListForm: list)
    viewController?.displayContactForm(viewModel: viewModel)
  }
  
  func presentFetchedError(error: Contact.Form.ErrorResponse) {
    let err = error.error
    
    switch err {
    case .businessError(let err):
      viewController?.displayError(title: err.title ?? "An error has occur", message: err.text ?? "Try again later")
      
    case .moyaError(_):
      viewController?.displayError(title: "An error has occur", message: "Try again later")
    }
  }
}
