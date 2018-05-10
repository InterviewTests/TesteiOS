//
//  SendMessageViewController.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 10/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import UIKit

class SendMessageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func returnButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
