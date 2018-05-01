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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTfFields()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    func setupTfFields() {
        self.tfFields[0].inputType = .default
        self.tfFields[1].inputType = .email
        self.tfFields[2].inputType = .mobileNumber
    }
}
