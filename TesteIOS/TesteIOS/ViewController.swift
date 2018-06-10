//
//  ViewController.swift
//  TesteIOS
//
//  Created by Sidney Silva on 31/05/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.load()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func load() {
        let worker = FormWorker()
        
        worker.fetchForm(success: { (response) in
            
        }, failure: { (failure) in
            
        })
    }


}

