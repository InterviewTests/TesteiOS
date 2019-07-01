//
//  FinishContactViewController.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 28/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import UIKit

class FinishContactViewController: UIViewController
{
    @IBAction func backAction()
    {
        self.navigationController?.popViewController(animated: false)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: false)
    }
}
