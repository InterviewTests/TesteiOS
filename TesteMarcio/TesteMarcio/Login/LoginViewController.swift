//
//  ViewController.swift
//  teste-ios
//
//  Created by marcio-mac on 25/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

import UIKit

protocol LoginViewControllerDisplayLogic {
    func displayInvalidLogin(viewObject: LoginModel.ValidateLogin.ViewObject)
    func displayStatementListScreen(viewObject: LoginModel.StatementListScreen.ViewObject)
    func displayLoadLoginInformation(viewObject: LoginModel.LoadLogin.ViewObject)
    func displayShowActivityIndicator(viewObject: LoginModel.ActivityIndicator.ViewObject)
    func displayHideActivityIndicator(viewObject: LoginModel.ActivityIndicator.ViewObject)
}

class LoginViewController: BaseViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    var interactor: LoginInteractorBusinessLogic?
    var router: LoginProtocolRoutingLogic?

    override func viewDidLoad() {
        super.viewDidLoad()
            
        setupUI()
    }
    
    func setupUI() {
        loginButton.layer.cornerRadius = 7
        setKeyboardAvoidance(scrollView: scrollView)
        interactor?.handleLoadLogin(request: LoginModel.LoadLogin.Request())
    }

    @IBAction func loginDidTouchUpInside(_ sender: Any) {
        interactor?.handleLogin(request: LoginModel.Login.Request(user: userText.text ?? "", password: passwordText.text ?? ""))
    }
}

extension LoginViewController: LoginViewControllerDisplayLogic {
    
    func displayShowActivityIndicator(viewObject: LoginModel.ActivityIndicator.ViewObject) {
        showActivityIndicator()
    }
    
    func displayHideActivityIndicator(viewObject: LoginModel.ActivityIndicator.ViewObject) {
        hideActivityIndicator()
    }
    
    
    func displayLoadLoginInformation(viewObject: LoginModel.LoadLogin.ViewObject) {
        userText.text = viewObject.user
        passwordText.text = viewObject.password
    }
    
    func displayInvalidLogin(viewObject: LoginModel.ValidateLogin.ViewObject) {
        print(viewObject)
        errorMessageLabel.text = viewObject.errorMessage
        errorMessageLabel.isHidden = false
    }
    
    func displayStatementListScreen(viewObject: LoginModel.StatementListScreen.ViewObject) {
        router?.routToStatementScreen(withUser: viewObject.user)
    }
}
