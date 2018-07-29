//
//  ViewController.swift
//  iOSTest
//
//  Created by erick.peripolli on 29/07/18.
//  Copyright © 2018 Erick Peripolli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let height = tabBarController?.tabBarItem.titlePositionAdjustment
        print(height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

