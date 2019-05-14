//
//  ViewController.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 13/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiManager = FundsServiceApiManager.shared
        
        apiManager.getCellsList { (formCellsList, error) in
            print(formCellsList!.cells.map({$0.typefield}))
        }
        
    }


}

