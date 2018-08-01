//
//  SuccessViewController.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//

import UIKit

protocol BackToContactsDelegate {
    func backToContacts()
}

class SuccessViewController: UIViewController {

    var router: SuccessRouter!
    var delegate: BackToContactsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    func setup() {
        self.router = SuccessRouter()
        router.viewController = self
    }
    
    
    @IBAction func tapBackToFormView(_ sender: Any) {
        router.backToContacts()
    }
    
}
