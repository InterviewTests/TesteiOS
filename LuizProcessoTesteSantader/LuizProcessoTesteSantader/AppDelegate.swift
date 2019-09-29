//
//  AppDelegate.swift
//  LuizProcessoTesteSantader
//
//  Created by Luiz Otavio Processo on 26/09/19.
//  Copyright © 2019 Luiz Otavio Processo. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let window = self.window {
            window.backgroundColor = .white
            let mainView = FormViewController()
//            let mainView = InvestViewController()
            let navigation = UINavigationController(rootViewController: mainView)
//            navigation.title = "Contato"
//            navigation.viewControllers = [mainView]
            window.rootViewController = navigation
            window.makeKeyAndVisible()
        }
        return true
    }

}

