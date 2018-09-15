//
//  ViewControllerContainment.swift
//  Investimentos
//
//  Created by Adolfho Athyla on 15/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

class ViewControllerContainment: UIViewController {

    @IBOutlet var containerView: UIView!
    @IBOutlet var fundsButton: UIButton!
    @IBOutlet var formButton: UIButton!
    
    var viewControllerPresented: ViewControllerPresented?
    
    lazy var fundsViewController: UINavigationController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var navigation = storyboard.instantiateViewController(withIdentifier: StoryboardIdentifiersNamespaces.FundsViewController) as? UINavigationController
        
        self.addViewControllerAsChildViewController(childViewController: navigation!)
        
        return navigation!
    }()
    
    lazy var formViewController: UINavigationController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var navigation = storyboard.instantiateViewController(withIdentifier: StoryboardIdentifiersNamespaces.FormViewController) as? UINavigationController
        
        self.addViewControllerAsChildViewController(childViewController: navigation!)
        
        return navigation!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configSantanderTabBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Init methods
    private func configSantanderTabBar() {
        fundsViewController.view.isHidden = false
        viewControllerPresented = .FundsViewController
        paintTabBar()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func addViewControllerAsChildViewController(childViewController: UINavigationController) {
        addChildViewController(childViewController)
        
        containerView.addSubview(childViewController.view)
        
        childViewController.view.frame = containerView.bounds
        childViewController.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        childViewController.didMove(toParentViewController: self)
    }
    
    private func removeViewControllerAsChildViewController(childViewController: UIViewController) {
        childViewController.willMove(toParentViewController: nil)
        
        childViewController.view.removeFromSuperview()
        
        childViewController.removeFromParentViewController()
    }
    
    //MARK: - Santander tab bar
    @IBAction func showFundsViewController(_ sender: UIButton) {
        formViewController.view.isHidden = true
        fundsViewController.view.isHidden = false
        viewControllerPresented = .FundsViewController
        paintTabBar()
    }
    
    @IBAction func showFormViewController(_ sender: UIButton) {
        fundsViewController.view.isHidden = true
        formViewController.view.isHidden = false
        viewControllerPresented = .FormViewController
        paintTabBar()
    }
    
    //appearence
    private func paintTabBar() {
        guard let viewControllerPresented = self.viewControllerPresented else { return }
        switch viewControllerPresented {
        case .FundsViewController:
            //color
            formButton.backgroundColor = #colorLiteral(red: 0.89276582, green: 0.1277235746, blue: 0, alpha: 1)
            fundsButton.backgroundColor = #colorLiteral(red: 0.8334353566, green: 0.1204492822, blue: 0, alpha: 1)
            
            //scale
            formButton.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1)
            fundsButton.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1.1)
            
        case .FormViewController:
            //color
            fundsButton.backgroundColor = #colorLiteral(red: 0.89276582, green: 0.1277235746, blue: 0, alpha: 1)
            formButton.backgroundColor = #colorLiteral(red: 0.8334353566, green: 0.1204492822, blue: 0, alpha: 1)
            
            //scale
            fundsButton.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1)
            formButton.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1.1)
        }
    }
}
