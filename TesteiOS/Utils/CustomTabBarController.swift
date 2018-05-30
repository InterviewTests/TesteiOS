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
    override func viewDidLoad() {
        super.viewDidLoad()
        customTabBarView?.frame.size.width = self.view.frame.width
        customTabBarView?.frame.origin.y = self.view.frame.height - (customTabBarView?.frame.size.height)!
        self.view.addSubview(customTabBarView!)
    }
    @IBAction func changeTab(sender: UIButton) {
        self.selectedIndex = sender.tag - 1
        if(sender.tag == 1) {
            let button = self.view.viewWithTag(2)
            button?.backgroundColor = UIColor(red: 218/255, green: 1/255, blue: 1/255, alpha: 1.0)
        } else {
            let button = self.view.viewWithTag(1)
            button?.backgroundColor = UIColor(red: 218/255, green: 1/255, blue: 1/255, alpha: 1.0)
        }
        sender.backgroundColor = UIColor(red: 191/255, green: 0/255, blue: 0/255, alpha: 1.0)
        
    }
}

