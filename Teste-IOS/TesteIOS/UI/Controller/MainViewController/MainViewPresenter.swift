//
//  MainViewModel.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//

import UIKit

class MainViewPresenter: NSObject {
    
    func loadViewController(mainViewController: MainViewController, childViewController: UIViewController){
        let router = MainRouter()
        let model = Main.ViewModel(mainViewController: mainViewController, childViewController: childViewController)
        router.navigate(mainView: model)
    }
    
    func setupViewController(identifier: String) -> UIViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        return viewController
    }
    
    func addViewController(viewController: Main.ViewModel) {
        let mainViewController = viewController.mainViewController
        let childViewController = viewController.childViewController
        
        mainViewController.addChildViewController(childViewController)
        mainViewController.container.addSubview(childViewController.view)
        childViewController.view.frame = mainViewController.container.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParentViewController: mainViewController)
    }
    
    func removeViewController(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParentViewController: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
    }
}
