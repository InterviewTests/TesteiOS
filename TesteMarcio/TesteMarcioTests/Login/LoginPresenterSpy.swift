//
//  PresenterSpy.swift
//  TesteMarcioTests
//
//  Created by marcio-mac on 31/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

@testable import TesteMarcio

class LoginPresenterSpy: LoginPresenterPresentionLogic {
    
    
    var statements: [Statement]?
    
    var presentValidadePasswordCalled = false
    func presentValidadePassword(response: LoginModel.ValidateLogin.Response) {
        presentValidadePasswordCalled = true
    }
    
    var presentStatementListScreenCalled = false
    var user: UserAccount?
    func presentStatementListScreen(response: LoginModel.StatementListScreen.Response) {
        presentStatementListScreenCalled = true
        user = response.user
    }
    
    func presentLoadLogin(response: LoginModel.LoadLogin.Response) {
        
    }
    
    var presentShowActivityIndicatorCalled = false
    func presentShowACtivityIndicator(response: LoginModel.ActivityIndicator.Response) {
        presentShowActivityIndicatorCalled = true
    }
    
    var presentHideActivityIndicatorCalled = false
    func presentHideACtivityIndicator(response: LoginModel.ActivityIndicator.Response) {
        presentHideActivityIndicatorCalled = true
    }
    
    var presentValidadeUserCalled = false
    var presentValidadeUserResponse = false
    func presentValidadeUser(response: LoginModel.ValidateLogin.Response) {
        presentValidadeUserCalled = true
        presentValidadeUserResponse = response.valid
    }
}
