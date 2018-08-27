//
//  SucessViewController.swift
//  Teste-STD
//
//  Created by Phelipe Campos on 22/05/18.
//  Copyright © 2018 Phelipe Campos. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class SucessViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func callSegue(_ sender: Any) {   
        dismissView()
    }
    func dismissView(){
        performSegue(withIdentifier: "unWindSegue", sender: nil)
    }
    
}
