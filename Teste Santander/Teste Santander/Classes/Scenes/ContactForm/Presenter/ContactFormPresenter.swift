//
//  ContactFormPresenter.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 28/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation

protocol ContactFormPresenterProtocol {
    func handleFormCells(cells: ContactModel)
}

class ContactFormPresenter: ContactFormPresenterProtocol {
    var viewController: ContactFormViewControllerProtocol?
    
    init(viewController: ContactFormViewControllerProtocol) {
        self.viewController = viewController
    }
    
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
}
