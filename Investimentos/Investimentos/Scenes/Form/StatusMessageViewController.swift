//
//  StatusMessageViewController.swift
//  Investimentos
//
//  Created by Adolfho Athyla on 16/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

class StatusMessageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - View actions
    @IBAction func SendNewMessageAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
