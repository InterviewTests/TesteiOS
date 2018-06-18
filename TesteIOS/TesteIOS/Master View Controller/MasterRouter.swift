//
//  MasterRouter.swift
//  TesteIOS
//
//  Created by Sidney Silva on 10/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class MasterRouter: NSObject {
    let masterViewModel = MasterViewPresenter()
    
    func navigate(masterView: Master.ViewModel){
        masterViewModel.removeViewController(asChildViewController: masterView.childViewController)
        masterViewModel.addViewController(viewController: masterView)
    }
}
