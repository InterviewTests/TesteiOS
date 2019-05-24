//
//  ViewController.swift
//  testeSantanderIOS
//
//  Created by Adauto Oliveira on 17/05/19.
//  Copyright © 2019 Adauto Oliveira. All rights reserved.
//

import UIKit
import TextFieldEffects
import UICheckbox_Swift

class ViewController: UIViewController, UITextFieldDelegate {

 
    @IBOutlet weak var viewMensagem: UIView!
    @IBOutlet weak var checkBoxBtn: UICheckbox!
    @IBOutlet weak var btnEnviar: RoundButton!
    
    @IBOutlet weak var tfNome: HoshiTextField!
    @IBOutlet weak var tfEmail: HoshiTextField!
    @IBOutlet weak var tfTelefone: HoshiTextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        REST.loadCell { (form) in
            print("[VIEWCONRTOLLER] \(String(describing: form?.cells))")
            
            
        }
    }
    
    public func validarTextfield (textFields: [UITextField]) -> Bool {
        
        var allOk : Bool = true
        
        for textField in textFields {
            
            if textField.text == "" {
                allOk = false
                let alert: UIAlertController = UIAlertController(title: "Campos não preenchidos", message: "Preencha os campos corretamente", preferredStyle: .alert)
                
                let actionOk: UIAlertAction = UIAlertAction(title: "Ok", style: .default) { (acao) in
                    
                    
                }
                
                alert.addAction(actionOk)
                self.present(alert, animated: true, completion: nil)
                break
            }
            
            
        }
        
        return allOk
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if tfNome.text == "" {
            tfNome.borderInactiveColor = UIColor.black
            tfNome.borderActiveColor = UIColor.red
        }else if tfNome.text?.isEmpty == false {
            tfNome.borderInactiveColor = UIColor.green
            tfNome.borderActiveColor = UIColor.green
        }else {
            tfNome.borderActiveColor = UIColor.red
            tfNome.borderInactiveColor = UIColor.black
        }
        if tfEmail.text == "" {
            tfEmail.borderInactiveColor = UIColor.black
            tfEmail.borderActiveColor = UIColor.red
        }else if tfNome.text?.isEmpty == false {
            tfEmail.borderInactiveColor = UIColor.green
            tfEmail.borderActiveColor = UIColor.green
        }else {
            tfEmail.borderActiveColor = UIColor.red
            tfEmail.borderInactiveColor = UIColor.black
        }
        if tfTelefone.text == "" {
            tfTelefone.borderInactiveColor = UIColor.black
            tfTelefone.borderActiveColor = UIColor.red
        }else if tfNome.text?.isEmpty == false {
            tfTelefone.borderInactiveColor = UIColor.green
            tfTelefone.borderActiveColor = UIColor.green
        }else {
            tfTelefone.borderActiveColor = UIColor.red
            tfTelefone.borderInactiveColor = UIColor.black
        }
        self.view.endEditing(true)
        return true
    }

    
  
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if tfNome.text == "" {
            tfNome.borderInactiveColor = UIColor.black
            tfNome.borderActiveColor = UIColor.red
        }else if tfNome.text?.isEmpty == false {
            tfNome.borderInactiveColor = UIColor.green
            tfNome.borderActiveColor = UIColor.green
        }else {
            tfNome.borderActiveColor = UIColor.red
            tfNome.borderInactiveColor = UIColor.black
        }
        if tfEmail.text == "" {
            tfEmail.borderInactiveColor = UIColor.black
            tfEmail.borderActiveColor = UIColor.red
        }else if tfNome.text?.isEmpty == false {
            tfEmail.borderInactiveColor = UIColor.green
            tfEmail.borderActiveColor = UIColor.green
        }else {
            tfEmail.borderActiveColor = UIColor.red
            tfEmail.borderInactiveColor = UIColor.black
        }
        if tfTelefone.text == "" {
            tfTelefone.borderInactiveColor = UIColor.black
            tfTelefone.borderActiveColor = UIColor.red
        }else if tfNome.text?.isEmpty == false {
            tfTelefone.borderInactiveColor = UIColor.green
            tfTelefone.borderActiveColor = UIColor.green
        }else {
            tfTelefone.borderActiveColor = UIColor.red
            tfTelefone.borderInactiveColor = UIColor.black
        }
        return true
    }
  
   
    


    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if tfNome.text == "" {
            tfNome.borderInactiveColor = UIColor.black
            tfNome.borderActiveColor = UIColor.red
        }else if tfNome.text?.isEmpty == false {
            tfNome.borderInactiveColor = UIColor.green
            tfNome.borderActiveColor = UIColor.green
        }else {
            tfNome.borderActiveColor = UIColor.red
            tfNome.borderInactiveColor = UIColor.black
        }
        if tfEmail.text == "" {
            tfEmail.borderInactiveColor = UIColor.black
            tfEmail.borderActiveColor = UIColor.red
        }else if tfNome.text?.isEmpty == false {
            tfEmail.borderInactiveColor = UIColor.green
            tfEmail.borderActiveColor = UIColor.green
        }else {
            tfEmail.borderActiveColor = UIColor.red
            tfEmail.borderInactiveColor = UIColor.black
        }
        if tfTelefone.text == "" {
            tfTelefone.borderInactiveColor = UIColor.black
            tfTelefone.borderActiveColor = UIColor.red
        }else if tfNome.text?.isEmpty == false {
            tfTelefone.borderInactiveColor = UIColor.green
            tfTelefone.borderActiveColor = UIColor.green
        }else {
            tfTelefone.borderActiveColor = UIColor.red
            tfTelefone.borderInactiveColor = UIColor.black
        }
        tfNome.resignFirstResponder()
        tfEmail.resignFirstResponder()
        tfTelefone.resignFirstResponder()
    }
    

    @IBAction func checkBoxSelected(_ sender: UICheckbox) {
        
       
       
    }
    
   
    @IBAction func btnEnviar(_ sender: UIButton) {
        
        if validarTextfield(textFields: [tfNome, tfEmail, tfTelefone]) == true {
            self.viewMensagem.isHidden = false
        }
        
    
    }
    
    
    @IBAction func novaMensagem(_ sender: UIButton) {
        
        self.viewMensagem.isHidden = true
        self.tfNome.text = ""
        self.tfEmail.text = ""
        self.tfTelefone.text = ""
        
        self.tfNome.borderInactiveColor = UIColor.black
        self.tfEmail.borderInactiveColor = UIColor.black
        self.tfTelefone.borderInactiveColor = UIColor.black
        
        
        if checkBoxBtn.isSelected == true {
            checkBoxBtn.isSelected = false
        }
        
    }
    
        
       
    
}


