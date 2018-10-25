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
        
        self.textFieldUser.placeholder = Login.placeholderUser
        self.textFieldUser.layer.cornerRadius = 4.0
        self.textFieldUser.layer.borderWidth = 1.0
        self.textFieldUser.layer.borderColor = UIColor(red: 0.86, green: 0.89, blue: 0.93, alpha: 1.0).cgColor
        self.textFieldUser.borderStyle = UITextField.BorderStyle.roundedRect
        
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


}
