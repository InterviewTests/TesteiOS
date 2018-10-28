//
//  PostDataInteractor.swift
//  TesteiOS
//
//  Created by Gabriel Soria Souza on 22/10/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import LocalAuthentication
import UIKit


protocol PostAndAuthInteractorProtocol {
    func post(dataToBePosted: DetailDataToBePosted, viewController: LoginViewController)
    var lastUserLogged: String! { get set }
    func checkAuthentication(context: LAContext, loginViewController: LoginViewController, credentialsDelegate: UserAndSafeDataDelegate)
    func authentication(loginViewController: LoginViewController, credentialsDelegate: UserAndSafeDataDelegate)
    func login(loginViewController: LoginViewController, delegate: UserAndSafeDataDelegate, router: UserTransactionsRouter)
}

protocol ToBePosted {
    var data: DetailDataToBePosted! { get set }
    var delegate: UserAndSafeDataDelegate? { get set }
}

class LoginInteractor: PostAndAuthInteractorProtocol, ToBePosted {
    
    
    var lastUserLogged: String!
    var presenter: LoginPresenter?
    var data: DetailDataToBePosted!
    var delegate: UserAndSafeDataDelegate?
    
    func post(dataToBePosted: DetailDataToBePosted, viewController: LoginViewController) {
        let loginData = UserDataForLogin(userId: dataToBePosted.userId, name: dataToBePosted.name, bankAccount: dataToBePosted.bankAccount, agency: dataToBePosted.agency, balance: dataToBePosted.balance)
        let completeLoginData = LoginData.init(userData: loginData, error: nil)
        
        RequestAndPostDataWorker.postData(loginData: completeLoginData, completion: { (sucess) in
            DispatchQueue.main.async {
                viewController.performSegue(withIdentifier: "segue", sender: nil)
                viewController.activityIndicator.stopAnimating()
                viewController.activityIndicator.removeFromSuperview()
                viewController.view.alpha = 1.0
            }
        }) { (error) in
            viewController.activityIndicator.stopAnimating()
            viewController.activityIndicator.removeFromSuperview()
            viewController.view.alpha = 1.0
            let ac = UIAlertController(title: "Ops!", message: "Erro ao entrar, verifique sua conexão ou tente mais tarde", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            viewController.present(ac, animated: true, completion: nil)
        }
    }
    
    func authentication(loginViewController: LoginViewController, credentialsDelegate: UserAndSafeDataDelegate) {
        let context = LAContext()
        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthentication, error: nil) {
            self.checkAuthentication(context: context, loginViewController: loginViewController, credentialsDelegate: credentialsDelegate)
        }
    }
    
    func checkAuthentication(context: LAContext, loginViewController: LoginViewController, credentialsDelegate: UserAndSafeDataDelegate) {
        let reason = "Use suas credenciais para acessar sua conta"
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [unowned self] (success, error) in
                DispatchQueue.main.async {
                    if success {
                        guard let user = UserDefaults.standard.string(forKey: "userData") else { return }
                        let passwordReturn = credentialsDelegate.loadKeys(credentials: user)
                        
                        if let passwordData = passwordReturn {
                            loginViewController.passwordTextField.text = passwordData.password
                            loginViewController.loginAction()
                        }
                    } else {
                        print("error")
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Biometria não disponível", message: "Seu aparelho não está configurado para autenticar com biometria", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            loginViewController.present(ac, animated: true)
        }
    }
    
    func login(loginViewController: LoginViewController, delegate: UserAndSafeDataDelegate, router: UserTransactionsRouter) {
        guard let userTF = loginViewController.userTextField.text else { return }
        guard let passwordTF = loginViewController.passwordTextField.text else { return }
        
        if (delegate.isValidEmail(email: userTF) || delegate.isValidCPF(cpfInput: userTF)) && delegate.isValidPassword(input: passwordTF) {
            self.lastUserLogged = userTF
            UserDefaults.standard.set(userTF, forKey: "userData")
            let credentials = Credentials(username: userTF, password: passwordTF)
            do {
                try delegate.saveKeys(credentials: credentials)
            } catch {
                let alert = UIAlertController(title: "Erro", message: "Verifique suas credenciais e tente outra vez", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                loginViewController.present(alert, animated: true, completion: nil)
            }
            
        self.data = DetailDataToBePosted(userId: 1, name: "Jose da Silva Teste", bankAccount: "2050", agency: "012314564", balance: 3.3445)
        router.toBePosted = data
        loginViewController.addActivityIndicator()
        self.post(dataToBePosted: data, viewController: loginViewController)
        loginViewController.passwordTextField.text?.removeAll()
        
        } else {
            let alert = UIAlertController(title: "Dados inválidos", message: "Verifique seus dados", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            loginViewController.present(alert, animated: true, completion: nil)
        }
    }
}
