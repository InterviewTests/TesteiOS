//
//  LoginPresenterTest.swift
//  TesteMarcioTests
//
//  Created by marcio-mac on 31/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//


import XCTest
@testable import TesteMarcio

class LoginPresenterTest: XCTestCase {
    
    let presenter = LoginPresenter()
    
    let viewController = LoginViewControllerSpy()
    
    func testShowActivityIndicator() {
        
        presenter.viewController = viewController
        
        presenter.presentShowACtivityIndicator(response: LoginModel.ActivityIndicator.Response())
        
        XCTAssertTrue(viewController.displayShowActivityIndicatorCalled)
    }
    
    func testHideActivityIndicator() {
        
        presenter.viewController = viewController
        
        presenter.presentHideACtivityIndicator(response: LoginModel.ActivityIndicator.Response())
        
        XCTAssertTrue(viewController.displayHideActivityIndicatorCalled)
    }
    
    func testPresentInvalideUser() {
        presenter.viewController = viewController
        
        presenter.presentValidadeUser(response: LoginModel.ValidateLogin.Response(valid: false))
        
        XCTAssertTrue(viewController.displayInvalidLoginCalled)
    }
    
    func testPresentValideUser() {
        presenter.viewController = viewController
        
        presenter.presentValidadeUser(response: LoginModel.ValidateLogin.Response(valid: true))
        
        XCTAssertFalse(viewController.displayInvalidLoginCalled)
    }
    
    func testInvalidPassword() {
        presenter.viewController = viewController
        
        presenter.presentValidadePassword(response: LoginModel.ValidateLogin.Response(valid: false))
        
        XCTAssertTrue(viewController.displayInvalidLoginCalled)
    }
    
    func testScreenChange() {
        presenter.viewController = viewController
        
        presenter.presentStatementListScreen(response: LoginModel.StatementListScreen.Response(user: UserAccount()))
        
        XCTAssertTrue(viewController.displayStatementListScreenCalled)
    }
    
    func testLoadLogin() {
        presenter.viewController = viewController
        
        presenter.presentLoadLogin(response: LoginModel.LoadLogin.Response(user: "", password: ""))
        
        XCTAssertTrue(viewController.displayLoadLoginInformationCalled)
    }
}
