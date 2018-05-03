//
//  ContactViewController.swift
//  TesteiOS
//
//  Created by Ricardo Suman on 30/04/2018.
//  Copyright © 2018 Ricardo Suman. All rights reserved.
//

import UIKit

class MessageSentViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func newMessagePressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
