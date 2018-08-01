//
//  MainViewController.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var fundsButton: UIButton!
    @IBOutlet weak var formtButton: UIButton!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var fundsTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var formTopConstraint: NSLayoutConstraint!
    @IBOutlet var btnShare: UIBarButtonItem!
    
    let presenter = MainViewPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadViewController()
    }
    
    func loadViewController(){
        self.fundsButton.isEnabled = false
        self.formtButton.isEnabled = true
        self.navigationItem.title = "Investimento"
        self.navigationItem.rightBarButtonItem = self.btnShare
        self.configureButtonColor(focusButton: self.fundsButton, unfocusButton: self.formtButton)
        self.configureButtonSize(focusConstraint: self.fundsTopConstraint, unfocusConstraint: self.formTopConstraint)
        let fundsViewController = presenter.setupViewController(identifier: ViewControllersIdentifier.fundsIdentifier) as! FundsViewController
        presenter.loadViewController(mainViewController: self, childViewController: fundsViewController)
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
        self.fundsButton.isEnabled = false
        self.formtButton.isEnabled = true
        self.navigationItem.title = "Investimento"
        self.navigationItem.rightBarButtonItem = self.btnShare
        self.configureButtonColor(focusButton: self.fundsButton, unfocusButton: self.formtButton)
        self.configureButtonSize(focusConstraint: self.fundsTopConstraint, unfocusConstraint: self.formTopConstraint)
        let fundsViewController = presenter.setupViewController(identifier: ViewControllersIdentifier.fundsIdentifier) as! FundsViewController
        presenter.loadViewController(mainViewController: self, childViewController: fundsViewController)
    }
    
    @IBAction func tapForm(_ sender: Any) {
        self.fundsButton.isEnabled = true
        self.formtButton.isEnabled = false
        self.navigationItem.title = "Contato"
        self.navigationItem.rightBarButtonItem = nil
        self.configureButtonColor(focusButton: self.formtButton, unfocusButton: self.fundsButton)
        self.configureButtonSize(focusConstraint: self.formTopConstraint, unfocusConstraint: self.fundsTopConstraint)
        let formViewController = presenter.setupViewController(identifier: ViewControllersIdentifier.formIdentifier) as! ContactViewController
        formViewController.delegate = self
        presenter.loadViewController(mainViewController: self, childViewController: formViewController)
    }
    
    @IBAction func tapShare(_ sender: Any) {
        print("Tap")
    }
}

extension MainViewController: SuccessDelegate {
    func displaySuccessView() {
        let successViewController = presenter.setupViewController(identifier: ViewControllersIdentifier.successIdentifier) as! SuccessViewController
        successViewController.delegate = self
        presenter.loadViewController(mainViewController: self, childViewController: successViewController)
    }
}

extension MainViewController: BackToContactsDelegate {
    func backToContacts() {
        let formViewController = presenter.setupViewController(identifier: ViewControllersIdentifier.formIdentifier) as! ContactViewController
        formViewController.delegate = self
        presenter.loadViewController(mainViewController: self, childViewController: formViewController)
    }
}
