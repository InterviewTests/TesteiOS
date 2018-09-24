//
//  ViewMessageViewController.swift
//  Teste_iOS_Santander
//
//  Created by Fabricio Rodrigues on 23/09/2018.
//  Copyright © 2018 Fabricio Rodrigues. All rights reserved.
//

import UIKit

class ViewMessageViewController: UIViewController {

    @IBOutlet var bt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendNewMessage(_ sender: Any) {
        self.view.removeFromSuperview()
    }
}
