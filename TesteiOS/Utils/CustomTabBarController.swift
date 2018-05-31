//
//  CustomTabBar.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 30/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
    @IBOutlet var customTabBarView: UIView?
    
    @IBOutlet weak var contactBtn: UIButton?
    @IBOutlet weak var InvestBtn: UIButton?
    
    let selectedColor = UIColor(red: 191/255, green: 0/255, blue: 0/255, alpha: 1.0)
    let otherColor = UIColor(red: 218/255, green: 1/255, blue: 1/255, alpha: 1.0)
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateLayout()
        
    }
    
    
    func updateLayout() {
        self.contactBtn?.backgroundColor = selectedColor
        guard let height = customTabBarView?.frame.size.height else {
            return
        }
        guard let tabView = customTabBarView else {
            return
        }
        tabView.frame.size.width = self.view.frame.width
        tabView.frame.origin.y = self.view.frame.height - height
        
        self.view.addSubview(tabView)
    }
    
    @IBAction func changeTab(sender: UIButton) {
        
    }
    
    
    @IBAction func investBtnTap(_ sender: Any) {
        self.selectedIndex = 1
        self.contactBtn?.backgroundColor = otherColor
        self.InvestBtn?.backgroundColor = selectedColor
        
    }
    
    @IBAction func contactBtnTap(_ sender: Any) {
    self.selectedIndex = 0
    self.InvestBtn?.backgroundColor =  otherColor
    self.contactBtn?.backgroundColor = selectedColor
    }
    
    
}

