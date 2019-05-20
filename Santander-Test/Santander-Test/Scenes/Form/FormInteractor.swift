//
//  FormInteractor.swift
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

protocol FormBusinessLogic {
    func getFormCells(request: Form.GetFormCells.Request)
    func validateField(request: Form.FieldValidation.Request)
    func validateAllFields(request: Form.AllFieldsValidation.Request)
}

protocol FormDataStore {
    //var name: String { get set }
}

class FormInteractor: FormBusinessLogic, FormDataStore {
    var presenter: FormPresentationLogic?
    var worker: FormWorker?
    //var name: String = ""
    
    func getFormCells(request: Form.GetFormCells.Request) {
        worker = FormWorker()
        worker?.getFormCells(completion: { [unowned self] (formCells, error) in
            guard let formCells = formCells else {
                guard let error = error else {
                    let domain = "Ocorreu um erro inesperado!"
                    let error = NSError(domain: domain, code: 200, userInfo: nil)
                    let response = Form.FormError.Response(error: error, errorType: .missingCells)
                    self.presenter?.presentError(response: response)
                    return
                }
                let response = Form.FormError.Response(error: error as NSError, errorType: .getFormCells)
                self.presenter?.presentError(response: response)
                return
            }
            let response = Form.GetFormCells.Response(formCells: formCells)
            self.presenter?.presentFormCells(response: response)
        })
    }
    
    func validateField(request: Form.FieldValidation.Request) {
        worker = FormWorker()
        let isValid = worker?.validateField(text: request.text, typeField: request.typeField) ?? false
        let response = Form.FieldValidation.Response(indexPath: request.indexPath, isValid: isValid)
        presenter?.presentFieldValidation(response: response)
    }
    
    func validateAllFields(request: Form.AllFieldsValidation.Request) {
        worker = FormWorker()
        let tableView = request.tableView
        worker?.validateAllFields(
            tableView: tableView,
            completion: { (isValid, indexPath, message) in
                let response = Form.AllFieldsValidation.Response(
                    isValid: isValid,
                    indexPath: indexPath,
                    message: message
                )
                presenter?.presentAllFieldsValidation(response: response)
        })
    }
}
