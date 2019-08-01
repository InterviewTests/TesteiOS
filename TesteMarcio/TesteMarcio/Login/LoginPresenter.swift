//
//  LoginPresenter.swift
//  TesteMarcio
//
//  Created by marcio-mac Rabelo on 28/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

import Foundation

protocol LoginPresenterPresentionLogic {
    func presentValidadeUser(response: LoginModel.ValidateLogin.Response)
    func presentValidadePassword(response: LoginModel.ValidateLogin.Response)
    func presentStatementListScreen(response: LoginModel.StatementListScreen.Response)
    func presentLoadLogin(response: LoginModel.LoadLogin.Response)
    func presentShowACtivityIndicator(response: LoginModel.ActivityIndicator.Response)
    func presentHideACtivityIndicator(response: LoginModel.ActivityIndicator.Response)
}

class LoginPresenter: LoginPresenterPresentionLogic {
    
    var viewController: LoginViewControllerDisplayLogic?
    
    func presentShowACtivityIndicator(response: LoginModel.ActivityIndicator.Response) {
        viewController?.displayShowActivityIndicator(viewObject: LoginModel.ActivityIndicator.ViewObject())
    }
    
    func presentHideACtivityIndicator(response: LoginModel.ActivityIndicator.Response) {
        viewController?.displayHideActivityIndicator(viewObject: LoginModel.ActivityIndicator.ViewObject())
    }
    
    func presentValidadeUser(response: LoginModel.ValidateLogin.Response) {
        if !response.valid {
            viewController?.displayInvalidLogin(viewObject: LoginModel.ValidateLogin.ViewObject(errorMessage: "Usário inválido, usuário deve ser um cpf ou email válidos!"))
        }
    }
    
    func presentValidadePassword(response: LoginModel.ValidateLogin.Response) {
        if !response.valid {
            viewController?.displayInvalidLogin(viewObject: LoginModel.ValidateLogin.ViewObject(errorMessage: "Password inválido, password deve ter pelomenos 1 litra maiúscula, 1 caracter especial e 1 caracter alfa-numérico!"))
        }
    }
    
    func presentStatementListScreen(response: LoginModel.StatementListScreen.Response) {
        viewController?.displayStatementListScreen(viewObject: LoginModel.StatementListScreen.ViewObject(user: response.user))
    }
    
    func presentLoadLogin(response: LoginModel.LoadLogin.Response) {
        viewController?.displayLoadLoginInformation(viewObject: LoginModel.LoadLogin.ViewObject(user: response.user,password: response.password))
    }
    
    
    
}
