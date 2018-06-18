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
    @IBOutlet var btnShare: UIBarButtonItem!
    
    let presenter = MasterViewPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCustomFontToNavigationBar()
        self.loadViewController()
    }
    
    func setCustomFontToNavigationBar(){
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: Fonts.dinProMedium, size: 20)!]
    }
    
    func loadViewController(){
        self.navigationItem.title = "Investimento"
        self.navigationItem.rightBarButtonItem = self.btnShare
        self.configureButtonColor(focusButton: self.fundsButton, unfocusButton: self.formtButton)
        self.configureButtonSize(focusConstraint: self.fundsTopConstraint, unfocusConstraint: self.formTopConstraint)
        let fundsViewController = presenter.setupViewController(identifier: ViewControllersIdentifier.fundsIdentifier) as! FundsViewController
        presenter.loadViewController(masterViewController: self, childViewController: fundsViewController)
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
        self.navigationItem.title = "Investimento"
        self.navigationItem.rightBarButtonItem = self.btnShare
        self.configureButtonColor(focusButton: self.fundsButton, unfocusButton: self.formtButton)
        self.configureButtonSize(focusConstraint: self.fundsTopConstraint, unfocusConstraint: self.formTopConstraint)
        let fundsViewController = presenter.setupViewController(identifier: ViewControllersIdentifier.fundsIdentifier) as! FundsViewController
        presenter.loadViewController(masterViewController: self, childViewController: fundsViewController)
    }
    
    @IBAction func tapForm(_ sender: Any) {
        self.navigationItem.title = "Contato"
        self.navigationItem.rightBarButtonItem = nil
        self.configureButtonColor(focusButton: self.formtButton, unfocusButton: self.fundsButton)
        self.configureButtonSize(focusConstraint: self.formTopConstraint, unfocusConstraint: self.fundsTopConstraint)
        let formViewController = presenter.setupViewController(identifier: ViewControllersIdentifier.formIdentifier) as! ContactViewController
        presenter.loadViewController(masterViewController: self, childViewController: formViewController)
    }
    
    @IBAction func tapShare(_ sender: Any) {
        print("Tap")
    }
}
