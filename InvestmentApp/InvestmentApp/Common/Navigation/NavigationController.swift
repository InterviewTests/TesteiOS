//
//  NavigationController.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 22/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import Foundation
import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.barTintColor = UIColor.white
        
        navigationBar.backItem?.title = ""
        navigationBar.shadowImage = UIImage()
    }
}
