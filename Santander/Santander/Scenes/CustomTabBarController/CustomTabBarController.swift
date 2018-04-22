//
//  CustomTabBarController.swift
//  Santander
//
//  Created by Gabriel vieira on 4/22/18.
//  Copyright © 2018 Gabriel vieira. All rights reserved.
//

import UIKit

enum SelectedTab {
    case investment
    case contact
}

class CustomTabBarController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var selectedInvestmentView: UIView!
    @IBOutlet weak var investmentTab: UIButton!
    @IBOutlet weak var selectedContactView: UIView!
    @IBOutlet weak var contactTab: UIButton!
    var currentTab: SelectedTab = .investment
    var currentViewController: UIViewController = UIViewController()
    var spinner: LoaderView?
    
    var viewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spinner = LoaderView.init(currentView: self.view)
        self.setSelectedTab()
        self.setupControllers()
        self.changeController()
    }
    
    private func setupControllers() {
        
        let investmentController = InvestmentViewController()
        investmentController.rootController = self
        
        let contactViewController = ContactViewController()
        contactViewController.rootController = self
        
        self.viewControllers = [investmentController,contactViewController]
    }
    
    private func setSelectedTab() {
        switch self.currentTab {
        case .investment:
            self.investmentTab.backgroundColor = Color.darkRed
            self.selectedInvestmentView.isHidden = false
            
            self.contactTab.backgroundColor = Color.red
            self.selectedContactView.isHidden = true
            
        case .contact:
            self.contactTab.backgroundColor = Color.darkRed
            self.selectedContactView.isHidden = false
            
            self.investmentTab.backgroundColor = Color.red
            self.selectedInvestmentView.isHidden = true
        }
    }
    
    private func changeController() {
        
        self.currentViewController.view.removeFromSuperview()
        self.currentViewController.removeFromParentViewController()
        
        switch self.currentTab {
            case .investment:
                let investmentViewController = self.viewControllers[0]
                investmentViewController.view.frame = self.containerView.frame
                investmentViewController.view.frame.origin.y = 0.0
                self.currentViewController = investmentViewController
                self.addChildViewController(investmentViewController)
                self.containerView.addSubview(investmentViewController.view)
            case .contact:
                let contactViewController = self.viewControllers[1]
                contactViewController.view.frame = self.containerView.frame
                contactViewController.view.frame.origin.y = 0.0
                self.currentViewController = contactViewController
                self.addChildViewController(contactViewController)
                self.containerView.addSubview(contactViewController.view)
        }
    }

    @IBAction func investmentTabClick(_ sender: Any) {
        self.currentTab = .investment
        self.setSelectedTab()
        self.changeController()
    }
    
    @IBAction func contactTabClick(_ sender: Any) {
        self.currentTab = .contact
        self.setSelectedTab()
        self.changeController()
    }
    
    func showLoader() {
        self.spinner?.startAnimation()
    }
    
    func hideLoader() {
        self.spinner?.stopAnimating()
    }
    
}
