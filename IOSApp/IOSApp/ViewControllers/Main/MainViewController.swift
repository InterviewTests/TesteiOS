//
//  ViewController.swift
//  IOSApp
//
//  Created by Ana Beatriz Delavia Thomasi on 27/05/2018.
//  Copyright © 2018 Ana Beatriz Delavia Thomasi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var invstBtn: UIButton!
    @IBOutlet weak var contBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        invstBtnWasPressed(invstBtn)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func invstBtnWasPressed(_ sender: UIButton) {
        
        self.navigationItem.title = "Investimentos"
        setSelectedState(btn: invstBtn)
        setUnselectedState(btn: contBtn)
        remove(asChildViewController: formViewController)
        add(asChildViewController: fundViewController)
        
    }
    
    @IBAction func contBtnWasPressed(_ sender: UIButton) {
        
        self.navigationItem.title = "Contato"
        setSelectedState(btn: contBtn)
        setUnselectedState(btn: invstBtn)
        remove(asChildViewController: fundViewController)
        add(asChildViewController: formViewController)
        
    }
    
    func setSelectedState (btn:UIButton){
        btn.setBackgroundImage(nil, for: UIControlState.normal)
        btn.backgroundColor = UIColor(red:0.79, green:0.00, blue:0.00, alpha:1.0)
    }
    
    func setUnselectedState (btn:UIButton){
        btn.setBackgroundImage(#imageLiteral(resourceName: "tabbar-unselected-state"), for: UIControlState.normal)
        
    }
    
    
    private lazy var fundViewController: FundViewController = {
        
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "FundViewController") as! FundViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var formViewController: FormViewController = {
        
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "FormViewController") as! FormViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = CGRect(x:0, y:0, width: view.bounds.size.width, height: view.bounds.size.height - invstBtn.bounds.height )
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        
    }
    
    
    
}

