//
//  FormMessageViewController.swift
//  TesteiOS
//
//  Created by Andre Paganin on 04/09/18.
//  Copyright © 2018 Andre Paganin. All rights reserved.
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




