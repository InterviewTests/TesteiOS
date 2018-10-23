//
//  ViewController.swift
//  TesteiOS
//
//  Created by Gabriel Soria Souza on 19/10/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import UIKit

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
    var delegate: UserAndSafeDataDelegate?
    var interacor: PostToEndpoint?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        self.view.addSubview(bankImage)
        self.stack.addSubview(userTextField)
        self.stack.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
        self.view.addSubview(stack)
        self.delegate = self
        
        guard let user = UserDefaults.standard.string(forKey: "userData") else { return }
        
        guard let userTF = self.userTextField.text else { return }
        self.userTextField.text = user
        
        delegate?.loadKeys(user: userTF)
        
    }
    
    override func viewDidLayoutSubviews() {
        self.userTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.bankImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
        self.bankImage.widthAnchor.constraint(equalToConstant: 125).isActive = true
        self.bankImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        self.bankImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        self.view.trailingAnchor.constraint(equalTo: self.stack.trailingAnchor, constant: 15).isActive = true
        self.stack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        self.stack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        self.stack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        self.loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
        self.view.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor, constant: 100).isActive = true
        self.view.bottomAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 50).isActive = true
    }
    
    func setup() {
        let viewController = self
        let interactor = PostDataInteractor()
        viewController.interacor = interactor
    }
    
    @objc func loginAction() {
        guard let userTF = userTextField.text else { return }
        guard let passwordTF = passwordTextField.text else { return }
        guard let safeDelegate = delegate else { return }
        
        if (safeDelegate.isValidEmail(email: userTF) || safeDelegate.isValidCPF(cpfInput: userTF)) && safeDelegate.isValidPassword(input: passwordTF) {
            UserDefaults.standard.set(userTF, forKey: "userData")
            safeDelegate.saveKeys(user: userTF, pass: passwordTF)
            
        let detailDataToBePosted = DetailDataToBePosted(userId: 1, name: "Jose da Silva Teste", bankAccount: "2050", agency: "012314564", balance: 3.3445)
            
            interacor?.post(dataToBePosted: detailDataToBePosted)
            
        } else {
        let alert = UIAlertController(title: "Dados inválidos", message: "Verifique seus dados", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}
