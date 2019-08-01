//
//  LoginInteractor.swift
//  TesteMarcio
//
//  Created by marcio-mac Rabelo on 28/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

import Foundation

protocol LoginInteractorBusinessLogic {
    func handleLogin(request: LoginModel.Login.Request)
    func handleLoadLogin(request: LoginModel.LoadLogin.Request)
}

class LoginInteractor: LoginInteractorBusinessLogic {
   
    
    var presenter: LoginPresenterPresentionLogic?
    var worker: LoginWorkerProtocol?
    
    func handleLogin(request: LoginModel.Login.Request) {
        presenter?.presentShowACtivityIndicator(response: LoginModel.ActivityIndicator.Response())
        if !request.user.validateCPF() && !request.user.validateEmail() {
            self.presenter?.presentValidadeUser(response: LoginModel.ValidateLogin.Response(valid: false))
            presenter?.presentHideACtivityIndicator(response: LoginModel.ActivityIndicator.Response())
            return
        }
        
        if !request.password.validatePassword() {
            presenter?.presentHideACtivityIndicator(response: LoginModel.ActivityIndicator.Response())
            self.presenter?.presentValidadePassword(response: LoginModel.ValidateLogin.Response(valid: false))
            return
        }
        
        worker?.validateLogin(user: request.user, password: request.password, completionBlock: { userAccount in
            if let user = userAccount {
                self.worker?.saveLogin(user: request.user, password: request.password)
                self.presenter?.presentStatementListScreen(response: LoginModel.StatementListScreen.Response(user: user))
                self.presenter?.presentHideACtivityIndicator(response: LoginModel.ActivityIndicator.Response())
            }
        })
        
    }
    
    func handleLoadLogin(request: LoginModel.LoadLogin.Request) {
        self.presenter?.presentShowACtivityIndicator(response: LoginModel.ActivityIndicator.Response())
        worker?.loadLogin(completionBlock: { (user, password) in
            
            self.presenter?.presentLoadLogin(response: LoginModel.LoadLogin.Response(user: user ?? "", password: password ?? ""))
            self.presenter?.presentHideACtivityIndicator(response: LoginModel.ActivityIndicator.Response())
        })
    }
    
}
