//
//  BaseViewController.swift
//  Santander
//
//  Created by Gabriel vieira on 4/21/18.
//  Copyright © 2018 Gabriel vieira. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var spinner: LoaderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spinner = LoaderView.init(currentView: self.view)
    }
    
    func showLoader() {
        self.spinner?.startAnimation()
    }
    
    func hideLoader() {
        self.spinner?.stopAnimating()
    }
}
