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


    @IBOutlet weak var tfNome: HoshiTextField!
    @IBOutlet weak var tfEmail: HoshiTextField!
    @IBOutlet weak var tfTelefone: HoshiTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        REST.loadCell { (form) in
            
            print("[VIEWCONRTOLLER] \(form?.cells)")
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfNome.resignFirstResponder()
        tfEmail.resignFirstResponder()
        tfTelefone.resignFirstResponder()
    }
   
    
}


