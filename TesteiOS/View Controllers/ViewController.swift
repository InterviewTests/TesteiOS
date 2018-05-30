//
//  ViewController.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 28/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class ViewController: UIViewController {
    
    @IBOutlet weak var uiNameTextField: SkyFloatingLabelTextField?
    @IBOutlet weak var uiEmailTextField: SkyFloatingLabelTextField?
    @IBOutlet weak var uiPhoneTextField: SkyFloatingLabelTextField?
    @IBOutlet weak var uiSendBtn: UIButton?
    @IBOutlet weak var uiRecordEmailBtn: UIButton?
    
    private let name = "Nome Completo"
    private let email = "Email"
    private let phone = "Telefone"
    private let acessibilityName = "Nome"
    private let acessibilityEmail = "Email"
    private let acessibilityPhone = "Telefone"
    
    
    var apiFetcher: Fetcher?
    override func viewDidLoad() {
        super.viewDidLoad()

        apiFetcher?.fetch(request: Router.Form.create(jsonParameters: "").asURLRequest()) { data in
            print(data)
            
        }
        
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layoutTextFields()
        uiSendBtn?.layoutRedButton()
    }
    

    func layoutTextFields() {
        
        uiNameTextField?.layoutTextField(configText: self.name)
        uiEmailTextField?.layoutTextField(configText: self.email)
        uiPhoneTextField?.layoutTextField(configText: self.phone)
        
        uiNameTextField?.accessibilityLabel = self.acessibilityName
        uiEmailTextField?.accessibilityLabel = self.acessibilityEmail
        uiPhoneTextField?.accessibilityLabel = self.acessibilityPhone
    }
    
    func layoutButtons() {
        
    }
    @IBAction func recordMailBtnTap(_ sender: UIButton) {
    sender.setSelected()
    
    }
    
    
    @IBAction func sendBtnTap(_ sender: Any) {
        //validate fields and move next screen
    }


}

