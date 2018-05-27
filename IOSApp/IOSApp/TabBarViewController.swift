//
//  TabBarViewController.swift
//  IOSApp
//
//  Created by Ana Beatriz Delavia Thomasi on 27/05/2018.
//  Copyright © 2018 Ana Beatriz Delavia Thomasi. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
    
    @IBOutlet weak var invstBtn: UIButton!
    @IBOutlet weak var contBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func invstBtnWasPressed(_ sender: UIButton) {
        
        setSelectedState(btn: invstBtn)
        setUnselectedState(btn: contBtn)
    }
    
    @IBAction func contBtnWasPressed(_ sender: UIButton) {
        
        setSelectedState(btn: contBtn)
        setUnselectedState(btn: invstBtn)
    
    }
    
    func setSelectedState (btn:UIButton){
        btn.setBackgroundImage(nil, for: UIControlState.normal)
        btn.backgroundColor = UIColor(red:0.79, green:0.00, blue:0.00, alpha:1.0)
    }
    
    func setUnselectedState (btn:UIButton){
        btn.setBackgroundImage(#imageLiteral(resourceName: "tabbar-unselected-state"), for: UIControlState.normal)
        
    }
    
}
