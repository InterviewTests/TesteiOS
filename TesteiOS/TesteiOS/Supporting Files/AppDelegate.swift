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
    
    let tabController = TabBarViewController()
    
    
    self.window?.rootViewController = tabController
    
    self.window?.makeKeyAndVisible()
    
    return true
  }

}

