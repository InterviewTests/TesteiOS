//
//  ViewController.swift
//  TesteiOS
//
//  Created by Gabriel Soria Souza on 19/10/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginViewController: UIViewController, UserAndSafeDataDelegate {
    
    lazy var bankImage: UIImageView = {
        let image = UIImage(named: "Logo.png")
        let imageView = BankImage(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var userTextField: UITextField = {
        let textField = UserTextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    lazy var passwordTextField: UITextField = {
        let textField = PasswordTextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    lazy var loginButton: UIButton = {
        let button = LoginButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return button
    }()
    lazy var stack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userTextField, passwordTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 15.0
        return stackView
    }()
    lazy var authButton: UIButton = {
        let button = UIButton(frame: .zero)
        let image = UIImage(named: "auth")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(authFromPresenter), for: .touchUpInside)
        return button
    }()
    let activityIndicator = UIActivityIndicatorView(style: .gray)
    var delegate: UserAndSafeDataDelegate?
    var interactor: PostAndAuthInteractorProtocol?
    var routing: ShowTransacionsRouter?
    var transactionsInteractor: GetTransactions?
    var detailDataToBePosted: DetailDataToBePosted!
    let router = UserTransactionsRouter()
    var presenter: PresentPostData?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        self.view.addSubview(bankImage)
        self.stack.addSubview(userTextField)
        self.stack.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
        self.view.addSubview(stack)
        self.view.addSubview(authButton)
        self.delegate = self
        
        
        guard let user = UserDefaults.standard.string(forKey: "userData") else { return }
        
        if !user.isEmpty {
            self.userTextField.text = user
            guard let safeDelegate = delegate else { return }
            self.presenter?.authenticateData(loginViewController: self, credentialsDelegate: safeDelegate)
        }
    }
    
    override func viewDidLayoutSubviews() {
        self.userTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.bankImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
        self.bankImage.widthAnchor.constraint(equalToConstant: 125).isActive = true
        self.authButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.authButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 44).isActive = true
        self.bankImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        self.bankImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        self.view.trailingAnchor.constraint(equalTo: self.stack.trailingAnchor, constant: 15).isActive = true
        self.stack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        self.stack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        self.stack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        self.authButton.topAnchor.constraint(equalTo: self.stack.bottomAnchor, constant: 25).isActive = true
        self.authButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
        self.view.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor, constant: 100).isActive = true
        self.view.bottomAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 50).isActive = true
        
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        loginButton.layer.shadowRadius = 2.0
        loginButton.layer.shadowOpacity = 0.3
        loginButton.layer.masksToBounds = false
        loginButton.layer.shadowPath = UIBezierPath(roundedRect: loginButton.bounds, cornerRadius: loginButton.layer.cornerRadius).cgPath
        
    }
    
    func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        viewController.interactor = interactor
        viewController.routing = router
        viewController.presenter = presenter
    }
    
    @objc func loginAction() {
        guard let safeDelegate = delegate else { return }
        self.presenter?.login(loginViewController: self, delegate: safeDelegate, router: router)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            guard let vc = segue.destination as? UserTransactionsViewController else { return }
            router.routeToTransactions(destination: vc)
        }
    }
    
    @objc func authFromPresenter() {
        guard let safeDelegate = delegate else { return }
        self.presenter?.authenticateData(loginViewController: self, credentialsDelegate: safeDelegate)
    }

    
    func addActivityIndicator() {
        self.view.alpha = 0.5
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.startAnimating()
    }
}
