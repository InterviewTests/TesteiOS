//
//  SuccessViewController.swift
//  TesteIOS
//
//  Created by Sidney Silva on 14/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {

    var router: SuccessRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    func setup() {
        self.router = SuccessRouter()
        router.viewController = self
    }
    
    
    @IBAction func tapBackToFormView(_ sender: Any) {
        router?.backToContacts()
    }
    
}
