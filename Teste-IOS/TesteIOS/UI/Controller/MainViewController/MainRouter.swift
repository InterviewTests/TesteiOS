//
//  MainRouter.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//

import UIKit

class MainRouter: NSObject {
    let mainViewModel = MainViewPresenter()
    
    func navigate(mainView: Main.ViewModel){
        mainViewModel.removeViewController(asChildViewController: mainView.childViewController)
        mainViewModel.addViewController(viewController: mainView)
    }
}
