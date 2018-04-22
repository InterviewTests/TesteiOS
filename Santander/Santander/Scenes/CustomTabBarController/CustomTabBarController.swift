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
    
    var viewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSelectedTab()
        

        

        // Do any additional setup after loading the view.
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
    
}
