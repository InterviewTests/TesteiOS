//
//  MessageSentViewController.swift
//  TesteiOS
//
//  Created by Erika de Almeida Segatto on 24/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import UIKit

class MessageSentViewController: UIViewController {
    
    @IBOutlet var thankyouLabel: UILabel!
    @IBOutlet var messageSentLabel: UILabel!
    @IBOutlet var sendNewMessageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let theme = ThemeManager.current()
        thankyouLabel.textColor = theme.fundPrimaryTextColor
        thankyouLabel.font = theme.formFieldFont
        messageSentLabel.font = theme.fundPrimaryFont.withSize(28)
        sendNewMessageButton.titleLabel?.font = theme.formFieldFont
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
