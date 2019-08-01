//
//  LoginTest.swift
//  TesteMarcioTests
//
//  Created by marcio-mac on 31/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

import XCTest
@testable import TesteMarcio

class LoginInteractorTest: XCTestCase {
    
    var interactor = LoginInteractor()
    let presenterSpy = LoginPresenterSpy()
    let workerSpy = LoginWorkerSpy()
    
    func testInvalideUser() {
        
        interactor.presenter = presenterSpy
        interactor.handleLogin(request: LoginModel.Login.Request(user: "", password: ""))
        
        XCTAssertTrue(presenterSpy.presentShowActivityIndicatorCalled)
        XCTAssertTrue(presenterSpy.presentValidadeUserCalled)
        XCTAssertTrue(presenterSpy.presentHideActivityIndicatorCalled)
    }
    
    func testValideUserCPFInvalidPassword() {
        
        interactor.presenter = presenterSpy
        interactor.handleLogin(request: LoginModel.Login.Request(user: "09469471636", password: ""))
        
        XCTAssertTrue(presenterSpy.presentShowActivityIndicatorCalled)
        XCTAssertFalse(presenterSpy.presentValidadeUserCalled)
        XCTAssertTrue(presenterSpy.presentValidadePasswordCalled)
        XCTAssertTrue(presenterSpy.presentHideActivityIndicatorCalled)
    }
    
    func testValideUserEmailInvalidPassword() {
        
        interactor.presenter = presenterSpy
        interactor.handleLogin(request: LoginModel.Login.Request(user: "asd@asd.com", password: ""))
        
        XCTAssertTrue(presenterSpy.presentShowActivityIndicatorCalled)
        XCTAssertFalse(presenterSpy.presentValidadeUserCalled)
        XCTAssertTrue(presenterSpy.presentValidadePasswordCalled)
        XCTAssertTrue(presenterSpy.presentHideActivityIndicatorCalled)
    }
    
    func testValideUserValidPassword() {
        
        interactor.presenter = presenterSpy
        interactor.worker = workerSpy
        
        interactor.handleLogin(request: LoginModel.Login.Request(user: "asd@asd.com", password: "@2D"))
        
        XCTAssertTrue(presenterSpy.presentShowActivityIndicatorCalled)
        XCTAssertFalse(presenterSpy.presentValidadeUserCalled)
        XCTAssertFalse(presenterSpy.presentValidadePasswordCalled)
        XCTAssertTrue(workerSpy.validateLoginCalled)
        XCTAssertTrue(presenterSpy.presentStatementListScreenCalled)
        XCTAssertTrue(presenterSpy.user?.userId == 1)
        XCTAssertTrue(workerSpy.validateLoginCalled)
        XCTAssertTrue(presenterSpy.presentHideActivityIndicatorCalled)
    }
    
    func testHandleLoadLogin() {
        
        interactor.presenter = presenterSpy
        interactor.worker = workerSpy
        
        interactor.handleLoadLogin(request: LoginModel.LoadLogin.Request())
        
        XCTAssertTrue(presenterSpy.presentShowActivityIndicatorCalled)
    }
    
}
