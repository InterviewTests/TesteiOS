//
//  FormPresenter.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 14/05/19.
//  Copyright (c) 2019 Matheus Ribeiro. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FormPresentationLogic {
    func presentFormCells(response: Form.GetFormCells.Response)
    func presentError(response: Form.FormError.Response)
    func presentFieldValidation(response: Form.FieldValidation.Response)
    func presentAllFieldsValidation(response: Form.AllFieldsValidation.Response)
}

class FormPresenter: FormPresentationLogic {
    weak var viewController: FormDisplayLogic?
    
    func presentFormCells(response: Form.GetFormCells.Response) {
        
        var displayedCells: [Form.GetFormCells.ViewModel.DisplayViewModel] = []
        for formCell in response.formCells {
            
            guard let type = formCell.type else {
                continue
            }
            let message = formCell.message
            let typeField = formCell.typefield
            let hidden = formCell.hidden ?? false
            let topSpacing = formCell.topSpacing ?? 20
            let show = formCell.show
            let required = formCell.required ?? false
            
            let displayedCell = Form.GetFormCells.ViewModel.DisplayViewModel(
                type: type,
                message: message,
                typeField: typeField,
                hidden: hidden,
                topSpacing: topSpacing,
                show: show,
                required: required
            )
            
            displayedCells.append(displayedCell)
        }
        let viewModel = Form.GetFormCells.ViewModel(displayedFormCells: displayedCells)
        viewController?.displayFormCells(viewModel: viewModel)
    }
    
    func presentFieldValidation(response: Form.FieldValidation.Response) {
        let viewModel = Form.FieldValidation.ViewModel(indexPath: response.indexPath, isValid: response.isValid)
        viewController?.displayFieldValidation(viewModel: viewModel)
    }
    
    func presentAllFieldsValidation(response: Form.AllFieldsValidation.Response) {
        let isValid = response.isValid
        let indexPath = response.indexPath
        let message = response.message
        let viewModel = Form.AllFieldsValidation.ViewModel(
            isValid: isValid,
            indexPath: indexPath,
            message: message
        )
        viewController?.displayAllFieldsValidation(viewModel: viewModel)
    }
    
    func presentError(response: Form.FormError.Response) {
        
        var message: String
        switch response.errorType {
        case .getFormCells:
            message = response.error.localizedDescription
        case .missingCells:
            message = response.error.domain
        }
        let viewModel = Form.FormError.ViewModel(message: message, errorType: response.errorType)
        viewController?.displayError(viewModel: viewModel)
    }
}
