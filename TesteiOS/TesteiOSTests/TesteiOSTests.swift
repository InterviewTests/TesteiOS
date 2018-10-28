//
//  TesteiOSTests.swift
//  TesteiOSTests
//
//  Created by Gabriel Soria Souza on 26/10/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import XCTest
import LocalAuthentication
@testable import TesteiOS

class TesteiOSTests: XCTestCase {
    
    var loginInteractor: LoginInteractor!
    var detailDataToBePosted: DetailDataToBePosted!
    var viewController: LoginViewController!
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    var userTransactionsViewController: UserTransactionsViewController!

    override func setUp() {
        loginInteractor = LoginInteractor()
        viewController = LoginViewController()
    }

    override func tearDown() {
        
    }
    
    func test_loadLoginViewControllerInteractor() {
        viewController.loadViewIfNeeded()
        XCTAssertNotNil(viewController.interactor)
    }
    
    func test_loadLoginViewControllerPresenter() {
        viewController.loadViewIfNeeded()
        XCTAssertNotNil(viewController.presenter)
    }
    
    func test_loadLoginViewControllerRouter() {
        viewController.loadViewIfNeeded()
        XCTAssertNotNil(viewController.router)
    }
    
    func test_loadLoginViewControllerDelegate() {
        viewController.loadViewIfNeeded()
        XCTAssertNotNil(viewController.delegate)
    }
    
    func test_postingData() {
        detailDataToBePosted = DetailDataToBePosted(userId: 2, name: "Teste Gabriel", bankAccount: "123123", agency: "1231", balance: 1000.00)
        let loginData = UserDataForLogin(userId: detailDataToBePosted.userId, name: detailDataToBePosted.name, bankAccount: detailDataToBePosted.bankAccount, agency: detailDataToBePosted.agency, balance: detailDataToBePosted.balance)
        let completeLoginData = LoginData.init(userData: loginData, error: nil)
        
        RequestAndPostDataWorker.postData(loginData: completeLoginData, completion: { (success) in
            XCTAssertTrue(success)
        }) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func test_password() {
        viewController.loadViewIfNeeded()
        //password
        XCTAssertFalse(viewController.delegate!.isValidPassword(input: "aaa"))
        XCTAssertFalse(viewController.delegate!.isValidPassword(input: "aaa..."))
        XCTAssertFalse(viewController.delegate!.isValidPassword(input: "aaaHHH"))
        XCTAssertFalse(viewController.delegate!.isValidPassword(input: "HHH..."))
        XCTAssertFalse(viewController.delegate!.isValidPassword(input: ".1"))
        XCTAssertTrue(viewController.delegate!.isValidPassword(input: "1G>"))
        XCTAssertTrue(viewController.delegate!.isValidPassword(input: "K&a"))
        
        //CPF
        XCTAssertFalse(viewController.delegate!.isValidCPF(cpfInput: "4177579580"))
        XCTAssertFalse(viewController.delegate!.isValidCPF(cpfInput: "417757958"))
        XCTAssertFalse(viewController.delegate!.isValidCPF(cpfInput: "gabrielss.rock@me.com"))
        
        //EMAIL
        XCTAssertFalse(viewController.delegate!.isValidEmail(email: "@gmail.com"))
        XCTAssertFalse(viewController.delegate!.isValidEmail(email: "a@.com"))
        XCTAssertFalse(viewController.delegate!.isValidEmail(email: "a@.com"))
        XCTAssertFalse(viewController.delegate!.isValidEmail(email: "a@gmail."))
        XCTAssertTrue(viewController.delegate!.isValidEmail(email: "gabrielss.rock@me.com"))
        
    }
    
    func test_saveAndLoadKeys() {
        viewController.loadViewIfNeeded()
        let delegate = viewController.delegate
        let credentialTest = Credentials(username: "gabrielss.rock@me.com", password: "H.1")
        try? XCTAssertNotNil(delegate?.saveKeys(credentials: credentialTest))
        XCTAssertNotNil(delegate?.loadKeys(credentials: credentialTest.username))
    }
    
    func test_authentication() {
        viewController.loadViewIfNeeded()
        XCTAssertNotNil(viewController.delegate)
        viewController.userTextField.text = "41775795800"
        viewController.passwordTextField.text = "H.1"
        
        let context = LAContext()
        var theError: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &theError) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "TEST") { (success, error) in
                XCTAssertTrue(success)
                if success {
                    UserDefaults.standard.set(self.viewController.userTextField.text, forKey: "userData")
                }
                XCTAssertNil(error)
            }
        }
    }
}
