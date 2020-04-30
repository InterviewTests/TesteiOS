//
//  ContactFormPresenter.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 28/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation

protocol ContactFormPresenterProtocol {
    /// Receive the contact fields to present in view controller
    /// - Parameter cells: contact fields
    func handleFormCells(cells: ContactModel)
    
    /// Receive errors to present in view controller
    /// - Parameter error: error
    func handleError(error: Error?)
}

class ContactFormPresenter: ContactFormPresenterProtocol {
    // MARK: - Interface Properties
    var viewController: ContactFormViewControllerProtocol?
    
    // MARK: - Initialization
    init(viewController: ContactFormViewControllerProtocol) {
        self.viewController = viewController
    }
    
    // MARK: - ContactFormPresenterProtocol
    func handleFormCells(cells: ContactModel) {
        for cell in cells.cells {
            if !cell.hidden {
                switch cell.getCellType() {
                case .textField:
                    viewController?.configureTextField(cell: cell)
                case .message:
                    viewController?.configureMessage(cell: cell)
                case .checkBox:
                    viewController?.configureCheckBox(cell: cell)
                case .button:
                    viewController?.configureButton(cell: cell)
                default:
                    return
                }
            }
        }
    }
    
    func handleError(error: Error?) {
        if let errorMessage = error?.localizedDescription {
            viewController?.showError(errorMessage: errorMessage)
        }
    }
}
