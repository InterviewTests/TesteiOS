//
//  BaseViewController.swift
//  Santander
//
//  Created by Jonathan Martins on 07/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarColour()
    }
    
    /// Changes the navigation bar colour
    private func setNavigationBarColour(){
        self.navigationController?.navigationBar.isTranslucent   = true
        self.navigationController?.navigationBar.barTintColor    = .white
        self.navigationController?.navigationBar.backgroundColor = .white
    }
}
