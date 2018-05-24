//
//  SucessViewController.swift
//  TesteiOS
//
//  Created by Naville Brasil on 22/05/18.
//  Copyright © 2018 Luan Orlando. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
    
    @IBAction func sendNewMessage(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
    }
}


