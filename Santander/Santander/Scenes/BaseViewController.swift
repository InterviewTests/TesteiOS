//
//  BaseViewController.swift
//  Santander
//
//  Created by Gabriel vieira on 4/21/18.
//  Copyright © 2018 Gabriel vieira. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    
    var rootController: CustomTabBarController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showLoader() {
        self.rootController?.showLoader()
    }
    
    func hideLoader() {
        self.rootController?.hideLoader()
    }
}
