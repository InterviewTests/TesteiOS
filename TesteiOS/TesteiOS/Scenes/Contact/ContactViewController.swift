//
//  ContactViewController.swift
//  TesteiOS
//
//  Created by Ricardo Suman on 30/04/2018.
//  Copyright © 2018 Ricardo Suman. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    
    @IBOutlet var tfFields: [CustomTextField]!
    @IBOutlet weak var tfPhone: PhoneTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTfFields()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        self.view.addGestureRecognizer(gesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tfFields[0].text = ""
        tfFields[1].text = ""
        tfPhone.textField?.text = ""
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func canProceed() -> Bool {
        return (tfFields[0].validationState == .available && tfFields[1].validationState == .available && tfPhone.validationState == .available)
    }

    @IBAction func sendPressed(_ sender: Any) {
        guard canProceed() else { return }
        self.performSegue(withIdentifier: "ContactToMessageSegue", sender: nil)
    }
    
    func setupTfFields() {
        self.tfFields[0].inputType = .default
        self.tfFields[1].inputType = .email
    }
}
