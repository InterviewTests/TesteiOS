//
//  MasterViewModel.swift
//  TesteIOS
//
//  Created by Sidney Silva on 10/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class MasterViewPresenter: NSObject {
    
    func loadViewController(masterViewController: MasterViewController, childViewController: UIViewController){
        let router = MasterRouter()
        let model = Master.ViewModel(masterViewController: masterViewController, childViewController: childViewController)
        router.navigate(masterView: model)
    }
    
    func setupViewController(identifier: String) -> UIViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        return viewController
    }
    
    func addViewController(viewController: Master.ViewModel) {
        let masterViewController = viewController.masterViewController
        let childViewController = viewController.childViewController
        
        masterViewController.addChildViewController(childViewController)
        masterViewController.container.addSubview(childViewController.view)
        childViewController.view.frame = masterViewController.container.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParentViewController: masterViewController)
    }
    
    func removeViewController(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParentViewController: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
    }
}
