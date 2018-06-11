//
//  MasterViewController.swift
//  TesteIOS
//
//  Created by Sidney Silva on 10/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    @IBOutlet weak var fundsButton: UIButton!
    @IBOutlet weak var formtButton: UIButton!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var fundsTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var formTopConstraint: NSLayoutConstraint!
    
    let masterViewModel = MasterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadViewController()
    }
    
    func loadViewController(){
        self.configureButtonColor(focusButton: self.fundsButton, unfocusButton: self.formtButton)
        self.configureButtonSize(focusConstraint: self.fundsTopConstraint, unfocusConstraint: self.formTopConstraint)
        let fundsViewController = masterViewModel.setupViewController(identifier: ViewControllersIdentifier.fundsIdentifier) as! FundsViewController
        masterViewModel.loadViewController(masterViewController: self, childViewController: fundsViewController)
    }
    
    func configureButtonColor(focusButton: UIButton, unfocusButton: UIButton){
        focusButton.backgroundColor = #colorLiteral(red: 0.7764705882, green: 0.01568627451, blue: 0.01568627451, alpha: 1)
        unfocusButton.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.003921568627, blue: 0.003921568627, alpha: 1)
    }
    
    func configureButtonSize(focusConstraint: NSLayoutConstraint, unfocusConstraint: NSLayoutConstraint) {
        focusConstraint.constant = 0
        unfocusConstraint.constant = 2
    }

    @IBAction func tapFunds(_ sender: Any) {
        self.configureButtonColor(focusButton: self.fundsButton, unfocusButton: self.formtButton)
        self.configureButtonSize(focusConstraint: self.fundsTopConstraint, unfocusConstraint: self.formTopConstraint)
        let fundsViewController = masterViewModel.setupViewController(identifier: ViewControllersIdentifier.fundsIdentifier) as! ContactViewController
        masterViewModel.loadViewController(masterViewController: self, childViewController: fundsViewController)
    }
    
    @IBAction func tapForm(_ sender: Any) {
        self.configureButtonColor(focusButton: self.formtButton, unfocusButton: self.fundsButton)
        self.configureButtonSize(focusConstraint: self.formTopConstraint, unfocusConstraint: self.fundsTopConstraint)
        let formViewController = masterViewModel.setupViewController(identifier: ViewControllersIdentifier.formIdentifier) as! ContactViewController
        masterViewModel.loadViewController(masterViewController: self, childViewController: formViewController)
    }
}
