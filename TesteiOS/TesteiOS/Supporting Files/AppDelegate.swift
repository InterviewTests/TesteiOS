//
//  AppDelegate.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 19/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.backgroundColor = UIColor.white
    
    let tabBarController = TabBarViewController()
    let fundsVC = FundsViewController()
    let contactVC = ContactViewController()
    
    let fundsNavigationController = UINavigationController(rootViewController: fundsVC)
    let contactNavigationController = UINavigationController(rootViewController: contactVC)
    
    tabBarController.viewControllers = [fundsNavigationController, contactNavigationController]
    
    self.window?.rootViewController = tabBarController
    self.window?.makeKeyAndVisible()
    
    AppearanceProxyHelper.customizeNavigationBar()
    
    return true
  }

}

