//
//  FormMessageViewController.swift
//  InvestApp
//
//  Created by Victor tavares on 06/06/2018.
//  Copyright © 2018 Santander. All rights reserved.
//

import UIKit

class FormMessageViewController: UIViewController {

    let viewModel = FormMessageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func sendNewMessage(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
