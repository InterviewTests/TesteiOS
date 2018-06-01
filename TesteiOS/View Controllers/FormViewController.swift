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
    
    private let name = "Nome Completo"
    private let email = "Email"
    private let phone = "Telefone"
    private let acessibilityName = "Nome"
    private let acessibilityEmail = "Email"
    private let acessibilityPhone = "Telefone"
    
    var apiFetcher: Fetcher?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        apiFetcher?.fetch(request: Router.Form.get(params: "").asURLRequest()) { data in
            print(data)
            
            guard let data = data as? Data else {
                print("Error: No data to decode")
                return
            }
            
            let decoder = FormDecoder(data:data)
            decoder.decode()
                        

//
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        uiNameTextField?.text = ""
        uiEmailTextField?.text = ""
        uiPhoneTextField?.text = ""
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        layoutTextFields()
    }
    
    
    func layoutTextFields() {
        
        uiNameTextField?.layoutTextField(configText: self.name)
        uiEmailTextField?.layoutTextField(configText: self.email)
        uiPhoneTextField?.layoutTextField(configText: self.phone)
        
        uiNameTextField?.accessibilityLabel = self.acessibilityName
        uiEmailTextField?.accessibilityLabel = self.acessibilityEmail
        uiPhoneTextField?.accessibilityLabel = self.acessibilityPhone
    }
    
    
    @IBAction func recordMailBtnTap(_ sender: Checkbox) {
        sender.setSelected()
    }
    
    
    @IBAction func sendBtnTap(_ sender: Any) {
        
        print(verifyFormFilling())
        if (verifyFormFilling()) {
            dismissKeyboard()
            self.performSegue(withIdentifier: "sucess", sender: self)
        }
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }

    func verifyFormFilling() -> Bool {
        
        guard let name = uiNameTextField,
              let email = uiEmailTextField,
              let phone = uiPhoneTextField else {
            return false
        }
        
        if  name.hasErrorMessage || name.verifyEmptiness() || email.hasErrorMessage || email.verifyEmptiness() ||  phone.hasErrorMessage || phone.verifyEmptiness() {
            return false
        }

        return true
    }
}

