//
//  SuccessViewController.swift
//  Santander
//
//  Created by Gabriel vieira on 4/23/18.
//  Copyright © 2018 Gabriel vieira. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func newMessageClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
