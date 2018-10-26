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
        button.addTarget(self, action: #selector(authentication), for: .touchUpInside)
        return button
    }()
    let activityIndicator = UIActivityIndicatorView(style: .gray)
    var delegate: UserAndSafeDataDelegate?
    var interactor: PostToEndpoint?
    var routing: ShowTransacionsRouter?
    var transactionsInteractor: GetTransactions?
    var detailDataToBePosted: DetailDataToBePosted!
    let router = UserTransactionsRouter()

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
            self.authentication()
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
        let interactor = PostDataInteractor()
        viewController.interactor = interactor
        viewController.routing = router
    }
    
    @objc func loginAction() {
        guard let userTF = userTextField.text else { return }
        guard let passwordTF = passwordTextField.text else { return }
        guard let safeDelegate = delegate else { return }
        
        if (safeDelegate.isValidEmail(email: userTF) || safeDelegate.isValidCPF(cpfInput: userTF)) && safeDelegate.isValidPassword(input: passwordTF) {
            interactor?.lastUserLogged = userTF
            UserDefaults.standard.set(userTF, forKey: "userData")
            let credentials = Credentials(username: userTF, password: passwordTF)
            do {
                try safeDelegate.saveKeys(credentials: credentials)
            } catch {
                print(error)
            }
            
        detailDataToBePosted = DetailDataToBePosted(userId: 1, name: "Jose da Silva Teste", bankAccount: "2050", agency: "012314564", balance: 3.3445)
            router.toBePosted = detailDataToBePosted
            self.addActivityIndicator()
            interactor?.post(dataToBePosted: detailDataToBePosted, viewController: self)
            self.passwordTextField.text?.removeAll()
        } else {
        let alert = UIAlertController(title: "Dados inválidos", message: "Verifique seus dados", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            guard let vc = segue.destination as? UserTransactionsViewController else { return }
            router.routeToTransactions(destination: vc)
        }
    }
    
    @objc func authentication() {
        let context = LAContext()
        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthentication, error: nil) {
            self.evaluateAuthentication(context: context)
        }
    }
    
    func evaluateAuthentication(context: LAContext) {
        let reason = "Use suas credenciais para acessar sua conta"
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [unowned self] (success, error) in
                DispatchQueue.main.async {
                    if success {
                        guard let safeDelegate = self.delegate else { return }
                        guard let user = UserDefaults.standard.string(forKey: "userData") else { return }
                        let passwordReturn = safeDelegate.loadKeys(credentials: user)
                        
                        if let passwordData = passwordReturn {
                            self.passwordTextField.text = passwordData.password
                            self.loginAction()
                        }
                    } else {
                        print("error")
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Biometria não disponível", message: "Seu aparelho não está configurado para autenticar com biometria", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
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
