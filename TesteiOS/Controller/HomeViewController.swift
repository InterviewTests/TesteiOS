//
//  ViewController.swift
//  TesteiOS
//
//  Created by Naville Brasil on 15/05/18.
//  Copyright © 2018 Luan Orlando. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController
{
    //Outlest
    @IBOutlet weak var containerInvestment: UIView!
    @IBOutlet weak var containerContact: UIView!
    @IBOutlet weak var viewBtInvestment: UIView!
    @IBOutlet weak var viewBtContact: UIView!
    @IBOutlet weak var buttonInvestment: UIButton!
    @IBOutlet weak var buttonContact: UIButton!
    
    var isInvestment = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.containerContact.isHidden = true
        
    }

    @IBAction func changeView(_ sender: UIButton)
    {
        self.isInvestment = !self.isInvestment
        
        switch sender.tag
        {
            case 1:
                print(1)
                self.viewBtContact.backgroundColor = .clear
                self.viewBtInvestment.backgroundColor = UIColor(named: "selectedButton")
                self.buttonContact.backgroundColor = UIColor(named: "main")
                self.buttonInvestment.backgroundColor = UIColor(named: "selectedButton")
                
                self.containerContact.isHidden = true
            default:
                print(2)
                self.viewBtInvestment.backgroundColor = .clear
                self.viewBtContact.backgroundColor = UIColor(named: "selectedButton")
                self.buttonContact.backgroundColor = UIColor(named: "selectedButton")
                self.buttonInvestment.backgroundColor = UIColor(named: "main")
                
                self.containerContact.isHidden = false
        }
    }
}

