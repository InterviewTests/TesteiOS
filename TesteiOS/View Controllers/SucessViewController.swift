//
//  SucessViewController.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 30/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import UIKit

class SucessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func writeNewMessageBtnTap(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    

}
