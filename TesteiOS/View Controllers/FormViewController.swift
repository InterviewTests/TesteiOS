//
//  ViewController.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 28/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class FormViewController: UIViewController {
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        uiNameTextField?.text = ""
        uiEmailTextField?.text = ""
        uiPhoneTextField?.text = ""
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layoutTextFields()
        layoutButtons()
        layoutNavigationBar()
        
    }
    

    func layoutNavigationBar() {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.white
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
        uiRecordEmailBtn?.layoutButtonText()
        uiSendBtn?.layoutRedButton()
    }
    
    @IBAction func recordMailBtnTap(_ sender: UIButton) {
        sender.setSelected()
    }
    
    
    @IBAction func sendBtnTap(_ sender: Any) {
        
        print(verifyFormFilling())
        if (verifyFormFilling()) {
            self.performSegue(withIdentifier: "sucess", sender: self)
        }
    }

    func verifyFormFilling() -> Bool {
        
        guard let name = uiNameTextField,
              let email = uiEmailTextField,
              let phone = uiPhoneTextField else {
            return false
        }
        
        if  name.hasErrorMessage || email.hasErrorMessage || phone.hasErrorMessage {
            return false
        }

        if name.verifyEmptiness() || email.verifyEmptiness() || phone.verifyEmptiness() {
            return false
        }
        return true
    }
}

