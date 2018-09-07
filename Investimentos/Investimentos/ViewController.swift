//
//  ViewController.swift
//  Investimentos
//
//  Created by Adolfho Athyla on 07/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        CellsAPI.getAllFormCells { (cells, success) in
            print(cells)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

