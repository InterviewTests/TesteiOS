//
//  MessageSentVC.swift
//  TesteiOS
//
//  Created by Nicolau on 17/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import UIKit

class MessageSentVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendNewMessage(_ sender: Any) {
        self.tabBarController?.selectedIndex = 1
    }
}
