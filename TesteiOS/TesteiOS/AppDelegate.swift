//
//  AppDelegate.swift
//  TesteiOS
//
//  Created by lucas.eiji.saito on 10/05/18.
//  Copyright © 2018 Accenture. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBar: UITabBarController = UITabBarController()
        let fundosVC = FundosViewController(nibName: "Fundos", bundle: nil)
        let formVC = FormViewController()
        fundosVC.tabBarItem = UITabBarItem(title: "Investimento", image: nil, tag: 0)
        formVC.tabBarItem = UITabBarItem(title: "Contato", image: nil, tag: 1)
        tabBar.viewControllers = [fundosVC, formVC]
        tabBar.tabBar.unselectedItemTintColor = UIColor.white
        let colorUnselected = UIColor(red: 202.0/255.0, green: 40.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        let colorSelected = UIColor(red: 186.0/255.0, green: 37.0/255.0, blue: 16.0/255.0, alpha: 1.0)
        tabBar.tabBar.barTintColor = colorUnselected
        tabBar.tabBar.tintColor = colorSelected
        
        let initialViewController = tabBar
        
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

