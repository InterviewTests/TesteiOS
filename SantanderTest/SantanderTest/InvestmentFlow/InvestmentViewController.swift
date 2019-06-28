//
//  InvestmentViewController.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 27/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import UIKit

class InvestmentViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Remove linha navigationBar
        self.navigationController?.navigationBar.backIndicatorImage = .init()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.shadowImage = .init()
    }
}

