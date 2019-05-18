//
//  ContactViewController.swift
//  santander
//
//  Created by Jonatha Lima on 18/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    weak var coordinator: (Funding & Contacting)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contato"
    }

}
