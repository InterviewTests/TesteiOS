//
//  LoginViewController.swift
//  new_test_iOS
//
//  Created by gabriel.p.dezena on 24/10/2018.
//  Copyright © 2018 gabriel.dezena. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var textFieldUser: UITextField!
    @IBOutlet weak var textFieldPw: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    private func setUp(){
        self.setUpImage()
        self.setUpForm()
        self.setUpButton()
    }
    private func setUpImage(){
        self.imageLogo.image = UIImage(named: Login.imageLogo)
    }
    
    private func setUpForm(){
        
        self.hideKeyboardWhenTappedAround()

        let user = Defaults.getLogin.user
        let pass = Defaults.getLogin.pass
        
        self.textFieldUser.text = user
        self.textFieldUser.autocorrectionType = .no
        self.textFieldUser.placeholder = Login.placeholderUser
        self.textFieldUser.layer.cornerRadius = 4.0
        self.textFieldUser.layer.borderWidth = 1.0
        self.textFieldUser.layer.borderColor = UIColor(red: 0.86, green: 0.89, blue: 0.93, alpha: 1.0).cgColor
        self.textFieldUser.borderStyle = UITextField.BorderStyle.roundedRect
       
        self.textFieldPw.text = pass
        self.textFieldPw.isSecureTextEntry = true
        self.textFieldPw.autocorrectionType = .no
        self.textFieldPw.placeholder = Login.placeholderPw
        self.textFieldPw.layer.cornerRadius = 4.0
        self.textFieldPw.layer.borderWidth = 1.0
        self.textFieldPw.layer.borderColor = UIColor(red: 0.86, green: 0.89, blue: 0.93, alpha: 1.0).cgColor
        self.textFieldPw.borderStyle = UITextField.BorderStyle.roundedRect
    }
    
    private func setUpButton(){
        self.buttonLogin.backgroundColor = UIColor(red:0.23, green:0.28, blue:0.93, alpha:1.0)
        self.buttonLogin.setTitle(Login.titleButtonLogin, for: .normal)
        self.buttonLogin.layer.cornerRadius = 4.0
        self.buttonLogin.layer.shadowColor = UIColor(red:0.23, green:0.28, blue:0.93, alpha:0.3).cgColor
    }
   
    func checkLogin(user: String, pass: String){
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "UserDataViewController") as! UserDataViewController
        
        if checkPass(text: pass) && (checkEmail(user: user)||checkCPF(user: user)){
            
            Defaults.clearUserData()
            Defaults.saveLogin(user, pass)
            
                BankAPI.getLoginData(user: user, pass: pass, onComplete: { (data) in
                    vc.user = data
                    if let id = data.userAccount.userId{
                    
                        BankAPI.loadUserData(session: id, onComplete: { (data) in
                            vc.statements = data.statementList
                            
                            self.present(vc, animated: true, completion: nil)

                        }) { (error) in
                            if let currentError = error {
                                self.presentAlert(error: currentError.rawValue)
                            }
                        }
                        
                    }
                    
                }) { (error) in
                    if let currentError = error{
                        self.presentAlert(error: currentError.rawValue)
                    }
                }

        }else{
            self.presentAlert(error: Login.erroSenha)
        }
    }
    

    @IBAction func login(_ sender: Any) {

        if let pass = self.textFieldPw.text, let user = self.textFieldUser.text{
            checkLogin(user: user, pass: pass)
        }

    }
    
}
