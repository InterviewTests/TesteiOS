//
//  MasterViewController.swift
//  TesteIOS
//
//  Created by Sidney Silva on 10/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    @IBOutlet weak var container: UIView!
    let masterViewModel = MasterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadViewController()
    }
    
    func loadViewController(){
        let fundsViewController = masterViewModel.setupViewController(identifier: "FundsViewController") as! FundsViewController
        masterViewModel.loadViewController(masterViewController: self, childViewController: fundsViewController)
    }

    @IBAction func tapFunds(_ sender: Any) {
        let fundsViewController = masterViewModel.setupViewController(identifier: "FundsViewController") as! FundsViewController
        masterViewModel.loadViewController(masterViewController: self, childViewController: fundsViewController)
    }
    
    @IBAction func tapForm(_ sender: Any) {
        let formViewController = masterViewModel.setupViewController(identifier: "FormViewController") as! FormViewController
        masterViewModel.loadViewController(masterViewController: self, childViewController: formViewController)
    }
}
