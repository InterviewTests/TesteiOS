//
//  LoginViewControllerSpy.swift
//  TesteMarcioTests
//
//  Created by marcio-mac on 31/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

@testable import TesteMarcio

class LoginViewControllerSpy : LoginViewControllerDisplayLogic {
    
    var displayInvalidLoginCalled = false
    func displayInvalidLogin(viewObject: LoginModel.ValidateLogin.ViewObject) {
        displayInvalidLoginCalled = true
    }
    
    var displayStatementListScreenCalled = false
    func displayStatementListScreen(viewObject: LoginModel.StatementListScreen.ViewObject) {
        displayStatementListScreenCalled = true
    }
    
    var displayLoadLoginInformationCalled = false
    func displayLoadLoginInformation(viewObject: LoginModel.LoadLogin.ViewObject) {
        displayLoadLoginInformationCalled = true
    }
    
    var displayShowActivityIndicatorCalled = false
    func displayShowActivityIndicator(viewObject: LoginModel.ActivityIndicator.ViewObject) {
        displayShowActivityIndicatorCalled = true
    }
    
    var displayHideActivityIndicatorCalled = false
    func displayHideActivityIndicator(viewObject: LoginModel.ActivityIndicator.ViewObject) {
        displayHideActivityIndicatorCalled = true
    }
    
    
}
